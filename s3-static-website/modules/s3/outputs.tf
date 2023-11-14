output "arn" {
  description = "AWS S3 ARN"
  value       = aws_s3_bucket.this.arn
}

output "bucket" {
  description = "AWS S3 Bucket Name"
  value       = aws_s3_bucket.this.bucket
}

output "website_enpoint" {
  description = "AWS S3 Static Website Enpoint"
  value       = aws_s3_bucket_website_configuration.this.website_endpoint
}