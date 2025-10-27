provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0360c520857e3138f"
  instance_type = "t3.micro"
  tags = {
    CreatedBy     = "Juan Borges"
    ProvisionedBy = "Teraform"
  }
}