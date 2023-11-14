output "dns_name" {
  description = "DNS Name ALB"
  value       = aws_alb.this.dns_name
}

output "alb_id" {
  description = "ALB ID"
  value       = aws_alb.this.id
}

output "alb_tg_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.this.arn
}