resource "aws_instance" "website" {
  ami           = var.ami
  instance_type = var.instance_type
  tags          = merge(var.default_tags,
                         {
                          ami = var.ami
                          },
                           var.tags)
} 