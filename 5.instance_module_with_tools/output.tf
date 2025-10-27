#Instance 1
output "instance_id" {
  value = module.instance.instance_id
}

output "public_ip" {
  value = module.instance.public_ip
}

output "password" {
    sensitive = true
  value = module.instance.password
}

output "tags" {
  value = module.instance.tags
}

#Instance 2
output "instance_id_2" {
  value = module.instance_2.instance_id
}

output "public_ip_2" {
  value = module.instance_2.public_ip
}

output "password_2" {
    sensitive = true
  value = module.instance_2.password
}

output "tags_2" {
  value = module.instance_2.tags
}