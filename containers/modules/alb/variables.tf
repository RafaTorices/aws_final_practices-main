variable "alb_name" {
  description = "ALB Name"
  type        = string
  default     = null
}

variable "internal" {
  description = "ALB Internal or External"
  type        = bool
  default     = true
}

variable "load_balancer_type" {
  description = "ALB Type"
  type        = string
  default     = "application"
}

variable "security_groups" {
  description = "ALB Security Groups"
  type        = list(any)
  default     = []
}

variable "alb_tags" {
  description = "ALB Tags"
  type        = map(any)
  default     = {}
}

variable "alb_tg_name" {
  description = "ALB Target Groups Name"
  type        = string
  default     = null
}

variable "alb_tg_port" {
  description = "ALB Target Group Port"
  type        = number
  default     = 0
}

variable "alb_tg_protocol" {
  description = "ALB Target Group Protocol"
  type        = string
  default     = null
}

variable "target_type" {
  description = "ALB Target Group Type"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "ALB Target Group VPC ID"
  type        = string
  default     = null
}

variable "healthy_threshold" {
  description = "ALB Target Group Health Check - Healthy Threshold"
  type        = string
  default     = null
}

variable "interval" {
  description = "ALB Target Group Health Check - Interval"
  type        = string
  default     = null
}

variable "health_check_protocol" {
  description = "ALB Target Group Health Check - Protocol"
  type        = string
  default     = null
}

variable "matcher" {
  description = "ALB Target Group Health Check - Matcher"
  type        = string
  default     = null
}

variable "timeout" {
  description = "ALB Target Group Health Check - Timeout"
  type        = string
  default     = null
}

variable "path" {
  description = "ALB Target Group Health Check - Path"
  type        = string
  default     = null
}

variable "unhealthy_threshold" {
  description = "ALB Target Group Health Check - Unhealthy Threshold"
  type        = string
  default     = null
}

variable "alb_tg_tags" {
  description = "ALB Target Group Health Check - Tags"
  type        = map(any)
  default     = {}
}

variable "alb_listener_port" {
  description = "ALB Listener Port"
  type        = string
  default     = null
}

variable "alb_listener_protocol" {
  description = "ALB Listener Protocol"
  type        = string
  default     = null
}

variable "alb_listener_type" {
  description = "ALB Listener Type"
  type        = string
  default     = null
}
