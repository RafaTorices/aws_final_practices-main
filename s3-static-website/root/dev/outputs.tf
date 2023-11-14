output "website_enpoint" {
  description = "AWS S3 Static Website Enpoint"
  value       = module.static_website_s3.website_enpoint
}