resource "aws_cloudfront_origin_access_identity" "this" {
  comment = var.comment
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  default_root_object = var.default_root_object

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses
    content {
      error_caching_min_ttl = lookup(custom_error_response.value, "error_caching_min_ttl")
      error_code            = lookup(custom_error_response.value, "error_code")
      response_code         = lookup(custom_error_response.value, "response_code")
      response_page_path    = lookup(custom_error_response.value, "response_page_path")
    }
  }

  origin {
    domain_name = var.domain_name
    origin_id   = var.origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = var.acm_certificate_arn == "" ? null : "sni-only"
    minimum_protocol_version       = var.acm_certificate_arn == "" ? "TLSv1" : var.minimum_protocol_version
    cloudfront_default_certificate = var.acm_certificate_arn == "" ? true : false
  }

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = var.target_origin_id
    compress         = var.compress

    forwarded_values {
      headers = var.headers

      query_string = var.query_string

      cookies {
        forward = var.cookies
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    default_ttl            = var.default_ttl
    min_ttl                = var.min_ttl
    max_ttl                = var.max_ttl
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behaviors
    content {
      path_pattern     = lookup(ordered_cache_behavior.value, "path_pattern")
      allowed_methods  = lookup(ordered_cache_behavior.value, "allowed_methods")
      cached_methods   = lookup(ordered_cache_behavior.value, "cached_methods")
      target_origin_id = lookup(ordered_cache_behavior.value, "target_origin_id")

      forwarded_values {
        query_string = lookup(ordered_cache_behavior.value, "query_string")
        headers      = [lookup(ordered_cache_behavior.value, "headers", null)]

        cookies {
          forward = lookup(ordered_cache_behavior.value, "forward")
        }
      }

      min_ttl                = lookup(ordered_cache_behavior.value, "min_ttl")
      default_ttl            = lookup(ordered_cache_behavior.value, "default_ttl")
      max_ttl                = lookup(ordered_cache_behavior.value, "max_ttl")
      compress               = lookup(ordered_cache_behavior.value, "compress", null)
      viewer_protocol_policy = lookup(ordered_cache_behavior.value, "viewer_protocol_policy")
    }
  }

  web_acl_id = var.web_acl_id

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
    }
  }

  tags = var.cf_tags
}
