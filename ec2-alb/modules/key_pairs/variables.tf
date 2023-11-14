variable "algorithm" {
  description = "TLS Private Key Algorithm"
  type        = string
  default     = "RSA"
}

variable "rsa_bits" {
  description = "RSA Bits Length"
  type        = number
  default     = 1024
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = null
}

variable "filename" {
  description = "Filename of .PEM"
  type        = string
  default     = null
}

variable "file_permission" {
  description = "File Permission of .PEM"
  type        = number
  default     = 0400
}