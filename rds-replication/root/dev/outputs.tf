output "primary_address" {
  description = "RDS Primary Address"
  value       = module.primary.address
}

output "primary_port" {
  description = "RDS Primary Port"
  value       = module.primary.port
}

output "primary_arn" {
  description = "RDS Primary ARN"
  value       = module.primary.arn
}

output "replica_address" {
  description = "RDS Replica Address"
  value       = module.replica.address
}

output "replica_port" {
  description = "RDS Replica Port"
  value       = module.replica.port
}

output "replica_arn" {
  description = "RDS Replica ARN"
  value       = module.replica.arn
}