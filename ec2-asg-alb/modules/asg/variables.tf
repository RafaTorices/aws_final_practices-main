variable "lt_name" {
  description = "Launch Template Name"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "Launch Template Instance EC2 Type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Launch Template Instance EC2 Key Name"
  type        = string
  default     = null
}

variable "user_data" {
  description = "Launch Template Instance EC2 User Data"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Launch Template VPC Security Groups IDs"
  type        = string
  default     = null
}

variable "asg_name" {
  description = "AutoScaling Groups Name"
  type        = string
  default     = null
}

variable "min_size" {
  description = "AutoScaling Group Minimun Size"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "AutoScaling Group Maximun Size"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "AutoScaling Gorup Desired Capacity"
  type        = number
  default     = 2
}

variable "target_group_arns" {
  description = "Target Group Associate with AutoScaling Group"
  type        = string
  default     = null
}

variable "tag_value" {
  description = "AutoScaling Group Tag Value from 'Name'"
  type        = string
  default     = null
}

variable "lb_target_group_arn" {
  description = "AutoScaling Group ALB Target Group ARN"
  type        = string
  default     = null
}
