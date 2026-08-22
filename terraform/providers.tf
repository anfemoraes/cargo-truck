terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket       = "cargo-truck-tfstate-140878155549"
    key          = "cargo-truck/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true # lock nativo do S3 (Terraform >= 1.10), evita apply concorrente
  }
}

provider "aws" {
  region = var.aws_region
}
