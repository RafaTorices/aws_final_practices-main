output "id" {
  description = "Security Groups ID"
  value       = aws_security_group.this.id
}

output "arn" {
  description = "Security Groups ARN"
  value       = aws_security_group.this.arn
}

output "name" {
  description = "Security Groups Name"
  value       = aws_security_group.this.name
}

