terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend remoto: o state precisa viver fora do runner do GitHub Actions,
  # senao cada execucao do CI "esquece" o que ja foi criado e tenta duplicar
  # os recursos. Crie o bucket UMA VEZ (veja terraform/README.md) e descomente:
  #
  # backend "s3" {
  #   bucket       = "cargo-truck-tfstate-SEUNOME"
  #   key          = "cargo-truck/terraform.tfstate"
  #   region       = "us-east-1"
  #   encrypt      = true
  #   use_lockfile = true # lock nativo do S3 (Terraform >= 1.10), evita apply concorrente
  # }
}

provider "aws" {
  region = var.aws_region
}
