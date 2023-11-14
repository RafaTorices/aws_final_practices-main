output "alb_ns_name" {
  description = "ALB Public IP"
  value       = module.alb.dns_name
}

output "webserver_key_pairs" {
  description = "Webserver Key Pairs Private Name"
  value       = module.key_pairs.key_name
}

output "webserver_public_ip" {
  description = "Webserver Public IP"
  value       = module.webserver.ec2_public_ip
}