#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

MODULE_DIR="module"
TMP_ROOT_DIR=".tmp_ci_root"
TF_VERSION=${TF_VERSION:-"1.8.5"}   # ajuste se quiser outra versão

echo "🔍 Running validations for module: ${MODULE_DIR}"

# 1) terraform fmt (check) on module files (formatting)
echo "-> Checking terraform fmt..."
# run fmt check by creating a temp dir and referencing module? Instead just run fmt on files
terraform fmt -check -recursive "${MODULE_DIR}" || {
  echo "❌ terraform fmt failed (run 'terraform fmt -recursive module/')."
  exit 1
}

# 2) tflint on module (requires tflint installed)
echo "-> Running tflint..."
tflint --init
tflint --module --config .tflint.hcl "${MODULE_DIR}" || {
  echo "❌ tflint found issues."
  exit 1
}

# 3) tfsec (security)
echo "-> Running tfsec..."
tfsec "${MODULE_DIR}" || {
  echo "❌ tfsec found issues."
  exit 1
}

# 4) terraform-docs: generate/inject docs into module/readme.md
echo "-> Generating docs with terraform-docs..."
# run inside module so terraform-docs can detect variables & outputs
pushd "${MODULE_DIR}" > /dev/null
terraform-docs markdown . --config ../.terraform-docs.yml > README.md || {
  echo "❌ terraform-docs failed."
  popd > /dev/null
  exit 1
}
popd > /dev/null
echo "-> README.md injected/generated in ${MODULE_DIR}/README.md"

# 5) Python validation (variables description/type)
echo "-> Running custom python validations..."
python3 validate_variables.py || {
  echo "❌ Python validation failed."
  exit 1
}

# 6) Terracost - requires terraform plan json. Create temporary root to call module.
echo "-> Running Terracost (estimate) via temporary root..."
rm -rf "${TMP_ROOT_DIR}"
mkdir "${TMP_ROOT_DIR}"
cat > "${TMP_ROOT_DIR}/main.tf" <<EOF
terraform {
  required_version = ">= 0.13"
}

module "example" {
  source = "../${MODULE_DIR}"
  # if your module has required variables, set placeholders here:
  # instance_type = "t3.micro"
  # region = "us-east-1"
}
EOF

pushd "${TMP_ROOT_DIR}" > /dev/null
# init, plan, convert to json
terraform init -backend=false -input=false >/dev/null
terraform validate || true
terraform plan -out=tfplan.binary -input=false || true
terraform show -json tfplan.binary > plan.json || true
# run terracost estimate (uses the plan.json)
terracost estimate --terraform-plan plan.json --config ../terracost.yml || {
  echo "⚠️ Terracost reported potential issues or couldn't estimate everything (check logs)."
  popd > /dev/null
  # don't fail the pipeline necessarily? Up to you. We'll treat as non-fatal by default.
}
popd > /dev/null

echo "✅ All checks completed."
