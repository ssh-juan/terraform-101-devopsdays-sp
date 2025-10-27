#!/usr/bin/env python3
import re
import sys
from pathlib import Path

module_path = Path("module")
tf_files = list(module_path.glob("*.tf"))

if not tf_files:
    print("⛔ No .tf files found in module/ - nothing to validate.")
    sys.exit(1)

missing = []
for f in tf_files:
    text = f.read_text()
    # encontra blocos variable "name" { ... }
    for block in re.findall(r'variable\s+"(.*?)"\s*{([^}]*)}', text, re.DOTALL):
        name, body = block
        if 'description' not in body or 'type' not in body:
            missing.append(f"{name} (file: {f.name})")

if missing:
    print("\n🚨 Variáveis sem descrição ou tipo definido:")
    for m in missing:
        print("  -", m)
    sys.exit(1)
else:
    print("✅ Todas as variáveis do módulo possuem descrição e tipo definido.")
    sys.exit(0)
