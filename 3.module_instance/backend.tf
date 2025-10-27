terraform {
  backend "s3" {
    bucket = "juan-borges-terraform-state-xyzxyz"
    key    = "module_instance/terraform.tfstate"
  }
}