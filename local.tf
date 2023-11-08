resource "local_file" "exemplo" {
    content = "teste 2"
    filename = "${path.module}/exemplo.txt"
}