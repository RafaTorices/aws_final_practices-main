module "static_website_s3" {
  source = "../../modules/s3"

  bucket        = "chamo-1971-static-website"
  force_destroy = true
  identifiers   = module.cloudfront.iam_arn

  files = {
    index = {
      "key" : "index.html"
      "source" : "../files/index.html"
      "source_hash" : "../files/index.html"
      "content_type" : "text/html"
    },
    error = {
      "key" : "error.html"
      "source" : "../files/error.html"
      "source_hash" : "../files/error.html"
      "content_type" : "text/html"
    }
  }

  tags = local.commons
}


module "cloudfront" {
  source = "../../modules/cloudfront"

  comment                = "S3 Static Website Origin Access Control"
  domain_name            = module.static_website_s3.bucket_regional_domain_name
  target_origin_id       = module.static_website_s3.bucket
  origin_id              = module.static_website_s3.bucket
  acm_certificate_arn    = ""
  viewer_protocol_policy = "redirect-to-https"

  cf_tags = local.commons
}
