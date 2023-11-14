output "address" {
  description = "RDS Address"
  value       = aws_db_instance.this.address
}

output "port" {
  description = "RDS Port"
  value       = aws_db_instance.this.port
}

output "arn" {
  description = "RDS ARN"
  value       = aws_db_instance.this.arn
}