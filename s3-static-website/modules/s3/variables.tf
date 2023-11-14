variable "bucket" {
  description = "AWS S3 Bucket Name"
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "AWS S3 Force Destroy"
  type        = bool
  default     = false
}

variable "custom_tag" {
  description = "AWS S3 Custom Tag"
  type        = map(any)
  default     = {}
}

variable "status" {
  description = "AWS S3 Versioning Status"
  type        = string
  default     = "Enabled"
}

variable "files" {
  description = "AWS S3 Objects of the Buckets"
  type        = map(any)
  default     = {}
}

variable "block_public_acls" {
  description = "AWS S3 Block Public ACLs"
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "AWS S3 Block Public Policy"
  type        = bool
  default     = false
}

variable "ignore_public_acls" {
  description = "AWS S3 Ignore Public ACLs"
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "AWS S3 Restrict Public Buckets"
  type        = bool
  default     = false
}

variable "suffix" {
  description = "AWS S3 Index Suffix"
  type        = string
  default     = "index.html"
}

variable "key" {
  description = "AWS S3 Error Key"
  type        = string
  default     = "error.html"
}