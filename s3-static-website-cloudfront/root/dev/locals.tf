locals {
  ordered_cache_behaviors = [
    {
      path_pattern           = "index.html"
      viewer_protocol_policy = "redirect-to-https"
      cached_methods         = ["GET", "HEAD"]
      allowed_methods        = ["HEAD", "GET", "POST"]
      default_ttl            = 60
      min_ttl                = 0
      max_ttl                = 86400
      compress               = "true"
      target_origin_id       = module.static_website_s3.bucket
      headers                = "*"
      query_string           = "true"
      forward                = "all"
    }
  ]

  custom_error_responses = [
    {
      error_caching_min_ttl = 1
      error_code            = 403
      response_code         = null
      response_page_path    = ""
    },
    {
      error_caching_min_ttl = 1
      error_code            = 404
      response_code         = null
      response_page_path    = ""
    }
  ]

  commons = {
    Name       = "s3-static-website"
    Enviroment = "dev"
  }
}
