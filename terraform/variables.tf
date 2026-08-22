variable "aws_region" {
  description = "Regiao AWS onde os recursos serao provisionados"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Nome do projeto, usado como prefixo/tag nos recursos"
  type        = string
  default     = "cargo-truck"
}

variable "environment" {
  description = "Ambiente (ex: test, staging, prod)"
  type        = string
  default     = "test"
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block da subnet publica"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone onde a subnet e a instancia serao criadas"
  type        = string
  default     = "us-east-2a"
}

variable "ssh_allowed_cidr" {
  description = "CIDR autorizado a acessar a porta 22 (seu IP/32, nunca 0.0.0.0/0)"
  type        = string
}

variable "ssh_public_key" {
  description = "Chave publica SSH (conteudo do .pub) usada para acessar a instancia"
  type        = string
}

variable "app_ports" {
  description = "Portas da aplicacao liberadas publicamente no Security Group (ex: 80, 3000, 8000)"
  type        = list(number)
  default     = [80, 3000]
}

variable "docker_compose_repo" {
  description = "URL do repositorio git que contem o docker-compose.yml a ser clonado na instancia"
  type        = string
}
