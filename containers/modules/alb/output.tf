output "dns_name" {
  description = "DNS Name ALB"
  value       = aws_alb.this.dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.this.arn
}