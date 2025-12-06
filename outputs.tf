output "public_ip" {
  description = "The public IP address assigned to the main web server instance."
  value       = aws_instance.workstation.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the main web server instance."
  value       = aws_instance.workstation.private_ip
}