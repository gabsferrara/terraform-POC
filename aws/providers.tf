terraform {
    required_version = ">=0.13.1"
  required_providers {
    aws = ">=3.54.0"
    local = ">= 2.1.0"
  }
  # para trabalhar com o terraform.tfstate compartilhado
  # backend "s3" {
  #   bucket = "mybucket"
  #   key = "terraform.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = "us-east-1"
}