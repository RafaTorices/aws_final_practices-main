output "id" {
  value = aws_cloudfront_distribution.this.id
}

output "arn" {
  value = aws_cloudfront_distribution.this.arn
}

output "status" {
  value = aws_cloudfront_distribution.this.status
}

output "domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "iam_arn" {
  value = aws_cloudfront_origin_access_identity.this.iam_arn
}


# defining output block

output "output-block" {
  value = <<EOF
# Cloudfront
|-> status                          = ${aws_cloudfront_distribution.this.status}
|-> origin                          = ${var.domain_name}
|-> cloudfront arn                  = ${aws_cloudfront_distribution.this.arn}
|-> cloudfront domain name          = ${aws_cloudfront_distribution.this.domain_name}
|-> certificate arn                 = ${var.acm_certificate_arn == null ? "none" : var.acm_certificate_arn}
|-> using default certificate?      = ${var.acm_certificate_arn == null ? "Yes" : "No"}
|-> using custom error response?    = ${length(var.custom_error_responses) != 0 ? "Yes" : "No"}
|-> using ordered cache behaviors?  = ${length(var.ordered_cache_behaviors) != 0 ? "Yes" : "No"}
EOF
}
