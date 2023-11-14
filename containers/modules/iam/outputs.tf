output "policy_arn" {
  description = "ARN of IAM Policy"
  value       = aws_iam_policy.this.*.arn
}

output "role_arn" {
  description = "ARN of IAM Role"
  value       = aws_iam_role.this.arn
}