# POC (Proof of Concept) - Terraform

  

## O que é o [Terraform](https://www.terraform.io/)?

  

O Terraform é uma ferramenta criada pela HashiCorp de infraestrutura como código (IaC) que nos permite provisionar e gerenciar recursos de infraestrutura de maneira automatizada através de linguagem declarativa. O terraform garante a idempotencia, graças a ter *estado declarativo, grafo de dependências, fase de planejamento do terraform* entre outras características.

## Propósito e resumo
Esta POC foi feita com o intuito de registrar meus estudos/contato inicial com o Terraform servindo como base para maiores aprofundamentos no futuro. Este provisiona tanto um arquivo [local](https://github.com/gabsferrara/terraform-POC/tree/main/local), quanto uma estrutura na [AWS](https://aws.amazon.com/pt/). Sendo que a estrutura de arquivos para o provisionamento na AWS esta disponível em dois formatos, um com arquivos declarativos mais *diretos* (configuração monolítica) disponível na branch [main](https://github.com/gabsferrara/terraform-POC/tree/main/aws) e com um formato usando module (configuração modular) disponível na branch [feature/module](https://github.com/gabsferrara/terraform-POC/tree/feature/modules/aws).
## Principais comandos
``
terraform init
``

``
terraform plan``

``
terraform apply``

``
terraform destroy``


## Elementos/blocos usados na POC

 - ### Resource
	 Usado para declarar um recurso que será gerenciado pelo Terraform. Recursos podem ser máquinas virtuais, redes, bancos de dados, entre outros.
```
resource "local_file" "example" {
    content = exampleContent
    filename = "${path.module}/exemple.txt"
}
```

 - ### Data
	 Usado para consultar dados externos que não são gerenciados diretamente pelo Terraform. Pode ser usado para obter informações sobre recursos existentes, como subnets, AMIs, etc.
```
data "local_file" "read_example_file" {
  filename = "${path.module}/exemple.txt"
}
```

 - ### Output
	 Usado para expor informações sobre os recursos gerenciados pelo Terraform.
```
output "data-source-result" {
    value = data.local_file.read_example_file.content_base64
}
```
 - ### Variable
	Permite definir variáveis que podem ser usadas para parametrizar sua configuração
```
variable "conteudo" {
  type = string
  default = "Texto que ira aparecer dentro do arquivo"
}

.:

resource "local_file" "exemplo" {
    content = var.conteudo
    filename = "${path.module}/exemplo.txt"
}
```
 - ### Provider
	 Usado para configurar o provedor de infraestrutura que o Terraform utilizará para gerenciar os recursos
```
provider "aws" {
  region = "us-east-1"
}
```

 - ### Backend
	 Usado para configurar o backend onde o estado do Terraform será armazenado.
```
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
```

 - ### Modules
	 Permitem organizar e reutilizar blocos de configuração Terraform.
```
module "example" {
  source = "./modules/example"
  // Configurações específicas do módulo
}
```

## Tipos de arquivos
- ###  *.tf
	Arquivos de configuração com linguagem declarativa criado pelo dev.
- ### *.tfvars
	Arquivo de variáveis do Terraform
- ### *.tfstate (gerado pelo Terraform)
	Arquivo com o estado atual da infra
- ### *.tfstate.backup (gerado pelo Terraform)
	Backup do arquivo .tfstate

## Links úteis
- ### [Calculadora de subnets](https://jodies.de/ipcalc)
	
## 
<p align="center">
  <img src="https://styles.redditmedia.com/t5_2u8e4/styles/communityIcon_6ctbbz76vzj51.png" height="300" alt="Imagem 2">
  <img src="https://media.giphy.com/media/CTX0ivSQbI78A/giphy.gif" height="300" alt="Imagem 1">
</p>
