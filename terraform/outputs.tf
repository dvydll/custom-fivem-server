output "server_ip" {
  description = "IP pública del servidor"
  value       = aws_instance.fivem_server.public_ip
}
