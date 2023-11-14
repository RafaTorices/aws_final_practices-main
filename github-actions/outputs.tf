output "github_iam_role_arn" {
  description = "ARN of the IAM role for GitHub"
  value       = module.github_iam.iam_role_arn
}

output "iam_user_info" {
  description = "IAM Users Info"
  value       = module.iam_users
  sensitive   = true
}

output "ec2_instances_info" {
  description = "Cyber ec2 instances info"
  value       = module.cyber_resources.ec2_instances_info
}
