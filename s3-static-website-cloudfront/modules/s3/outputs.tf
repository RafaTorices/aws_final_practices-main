output "bucket" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_regional_domain_name" {
  description = "S3 Bucket Regional Domain Name"
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}