variable "filename" {
  description = "Image Filename"
  type        = string
  default     = null
}

variable "name" {
  description = "Docker Image Name"
  type        = string
  default     = null
}

variable "tag" {
  description = "Docker Tag Build"
  type        = string
  default     = null
}

variable "platform" {
  description = "Docker Platform Build"
  type        = string
  default     = null
}

variable "environment" {
  description = "ECS Task Definition Environment Vars"
  type        = list(any)
  default     = []
}