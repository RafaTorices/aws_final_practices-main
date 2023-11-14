variable "instance_type" {
  description = "Instance EC2 Type"
  type        = string
  default     = "t2.micro"
}

variable "user_data" {
  description = "Instance EC2 User Data"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Instance EC2 Key Name .PEM"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "Instance EC2 VPC Security Groups IDs"
  type        = string
  default     = null
}

variable "tag_value" {
  description = "Instance EC2 Tag Value from 'Name'"
  type        = string
  default     = null
}