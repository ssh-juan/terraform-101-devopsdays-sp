terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      required_providers = ">= 4.0.0"
    }
    random = {
      source = "hashicorp/random"
      required_providers = ">= 1.0.0"
    }
  }
}