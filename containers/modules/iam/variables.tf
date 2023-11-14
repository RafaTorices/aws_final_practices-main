variable "role_name" {
  description = "IAM Role Name"
  type        = string
  default     = null
}

variable "role_description" {
  description = "IAM Role Description"
  type        = string
  default     = null
}

variable "create_policy" {
  description = "Create IAM Policy"
  type        = bool
  default     = false
}

variable "policy_name" {
  description = "IAM Policy Name"
  type        = string
  default     = null
}

variable "policy_description" {
  description = "IAM Policy Description"
  type        = string
  default     = null
}

variable "policy" {
  description = "IAM Policy"
  type        = string
  default     = null
}

variable "role" {
  description = "IAM Role to Policy"
  type        = string
  default     = null
}

variable "policy_arn" {
  description = "IAM Policy ARN Attach to Role"
  type        = list(any)
  default     = []
}

variable "custom_tag" {
  description = "IAM Policy Custom Tag"
  type        = map(any)
  default     = {}
}
