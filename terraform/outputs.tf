output "instance_public_ip" {
  description = "IP publico da instancia EC2"
  value       = aws_instance.app.public_ip
}

output "instance_id" {
  description = "ID da instancia EC2 (usado para aws ec2 wait instance-status-ok)"
  value       = aws_instance.app.id
}

output "ssh_command" {
  description = "Comando pronto para acessar a instancia via SSH"
  value       = "ssh -i cargo-truck-key ubuntu@${aws_instance.app.public_ip}"
}

output "frontend_url" {
  description = "URL do frontend (porta 80)"
  value       = "http://${aws_instance.app.public_ip}"
}

output "backend_url" {
  description = "URL do backend (porta 3000)"
  value       = "http://${aws_instance.app.public_ip}:3000"
}

output "security_group_id" {
  description = "ID do Security Group (usado pelo CI para autorizar seu proprio IP antes do deploy)"
  value       = aws_security_group.app.id
}
