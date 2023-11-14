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
  description = "Security Groups Rules"
  type        = map(any)
  default     = null
}