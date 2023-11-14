variable "name" {
  description = "Security Group Name"
  type        = string
  default     = null
}

variable "description" {
  description = "Security Group Description"
  type        = string
  default     = null
}

variable "rules" {
  description = "Rule for Security Group"
  type        = any
  default     = []
}