resource "local_file" "exemplo" {
    content = var.conteudo
    filename = "${path.module}/exemplo.txt"
}

variable "conteudo" {
  type = string
  default = "Hellow World"
}

output "id-file" {
    value = resource.local_file.exemplo.id
}

output "conteudo" {
    value = resource.local_file.exemplo.content
}