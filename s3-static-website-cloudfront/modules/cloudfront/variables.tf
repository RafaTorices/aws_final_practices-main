variable "comment" {
  description = "Cloudfront Origin Access Control Comment"
  type        = string
  default     = null
}

variable "enabled" {
  description = "Enable Cloudfront Distribution"
  default     = "true"
}

variable "default_root_object" {
  description = "Cloudfront Default Root Object"
  type        = string
  default     = "index.html"
}

variable "custom_error_responses" {
  # http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/custom-error-pages.html#custom-error-pages-procedure
  # https://www.terraform.io/docs/providers/aws/r/cloudfront_distribution.html#custom-error-response-arguments
  description = "Cloudfront Custom Error Messages"
  type        = any
  default     = {}
}

variable "domain_name" {
  description = "Cloudfront Domain Name"
  type        = string
  default     = null
}

variable "origin_id" {
  description = "Cloudfront Origin ID"
  type        = string
  default     = null
}

variable "acm_certificate_arn" {
  description = "Cloudfront ACM Certificate ARN"
  type        = string
  default     = null
}

variable "ssl_support_method" {
  description = "Cloudfront SSL Supprt Method"
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "Cloudfront Minimun Protocol Version"
  type        = string
  default     = "TLSv1.1_2016"
}

variable "allowed_methods" {
  description = "Cloudfront Allowed Methods"
  type        = list(any)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "cached_methods" {
  description = "Cloudfront Cached Methods"
  type        = list(any)
  default     = ["GET", "HEAD"]
}

variable "target_origin_id" {
  description = "Cloudfront Target Origin ID"
  type        = string
  default     = null
}

variable "compress" {
  description = "Cloudfront Compress"
  type        = string
  default     = "false"
}

variable "headers" {
  description = "Cloudfront Headers"
  type        = list(any)
  default     = []
}

variable "query_string" {
  description = "Cloudfront Query String"
  type        = string
  default     = "false"
}

variable "cookies" {
  description = "Cloudfront Cookies"
  type        = string
  default     = "none"
}

variable "viewer_protocol_policy" {
  description = "Cloudfront Viewer Protocol Policy"
  type        = string
  default     = "redirect-to-https"
}

variable "default_ttl" {
  description = "Cloudfront Default TTL"
  type        = string
  default     = "60"
}

variable "min_ttl" {
  description = "Cloudfront Minimum TTL"
  type        = string
  default     = "0"
}

variable "max_ttl" {
  description = "Cloudfront Maximun TTL"
  type        = string
  default     = "31536000"
}

variable "ordered_cache_behaviors" {
  description = "Cloudfront Ordered Cache Behaviors"
  type        = any
  default     = {}
}

variable "web_acl_id" {
  description = "Cloudfront Web ACL ID"
  type        = string
  default     = null
}

variable "restriction_type" {
  description = "Cloudfront Restriction Type"
  type        = string
  default     = "none"
}

variable "cf_tags" {
  description = "Cloudfront Tags"
  type        = map(any)
  default     = {}
}

