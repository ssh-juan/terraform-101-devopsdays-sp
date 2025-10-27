output "instance_id" {
  value = aws_instance.website.id
}

output "public_ip" {
  value = aws_instance.website.public_ip
} 

output "password" {
  value = random_password.password.result
}

output "tags" {
  value = aws_instance.website.tags_all
}
