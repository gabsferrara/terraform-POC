resource "local_file" "exemplo" {
    content = var.conteudo
    filename = "${path.module}/exemplo.txt"
}

data "local_file" "conteudo-exemplo" {
    filename = "${path.module}/exemplo.txt"
}

output "data-source-result" {
    value = data.local_file.conteudo-exemplo.content_base64
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