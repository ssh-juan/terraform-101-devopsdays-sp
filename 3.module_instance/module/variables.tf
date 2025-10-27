variable "ami" {
  type = string
  description = "Imagem Utilizada para subir a instância"
}
variable "instance_type" {
    description = "Tipo de Instância"
}

variable "tags" {
  type = map(string)
  description = "Tags inputadas pelo usuário"
  default = null
}

variable "default_tags" {
  type              = map(string)
  description = "Tags padrões"
  default = {
    CreatedBy     = "Juan",
    ProvisionedBy = "Terraform",
    Website = true
  }
}