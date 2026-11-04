output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.target.id
}

output "instance_public_ip" {
  description = "Public IP address of the target"
  value       = aws_instance.target.public_ip
}

output "instance_private_ip" {
  description = "Private IP address of the target"
  value       = aws_instance.target.private_ip
}

output "security_group_id" {
  description = "Target security group ID"
  value       = aws_security_group.target.id
}
