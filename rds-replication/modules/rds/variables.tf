variable "identifier_prefix" {
  description = "RDS Identifier Prefix"
  type        = string
  default     = null
}

variable "allocated_storage" {
  description = "RDS Allocated Storage"
  type        = number
  default     = 10
}

variable "instance_class" {
  description = "RDS Instance Class"
  type        = string
  default     = "db.t3.micro"
}

variable "skip_final_snapshot" {
  description = "RDS Skip Final Snapshot"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "RDS Backup Retention Period"
  type        = number
  default     = 7
}

variable "replicate_source_db" {
  description = "RDS Replicate Source DB"
  type        = string
  default     = null
}

variable "engine" {
  description = "RDS Engine"
  type        = string
  default     = "mysql"
}

variable "port" {
  description = "RDS Port"
  type        = number
  default     = 3306
}

variable "db_name" {
  description = "RDS Initial DB Name"
  type        = string
  default     = null
}

variable "username" {
  description = "RDS Username"
  type        = string
  sensitive   = true
  default     = null
}

variable "password" {
  description = "RDS Password"
  type        = string
  sensitive   = true
  default     = null
}

variable "custom_tag" {
  description = "RDS Custom Tag"
  type        = map(any)
  default     = {}
}