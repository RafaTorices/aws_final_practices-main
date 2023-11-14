output "arn" {
  description = "AWS S3 ARN"
  value       = aws_s3_bucket.this.arn
}

output "bucket" {
  description = "AWS S3 Bucket Name"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_domain_name" {
  description = "AWS S3 Bucket URL"
  value       = aws_s3_bucket.this.bucket_domain_name
}