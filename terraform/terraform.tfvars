aws_region    = "us-east-1"
project_name  = "cargo-truck"
environment   = "test"
instance_type = "t3.micro"

vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone  = "us-east-2a"

ssh_allowed_cidr = "187.180.80.242/32"
ssh_public_key   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGikWuVyCFoVEUEdv2KL4Zu/hpCPANlcXBB83lcOMCL4 cargo-truck"

app_ports = [80, 3000, 8000]

docker_compose_repo = "https://github.com/anfemoraes/cargo-truck.git"
