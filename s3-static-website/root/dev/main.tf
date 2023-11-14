module "static_website_s3" {
  source = "../../modules/s3"

  bucket        = "chamo-1971-static-website"
  force_destroy = true

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

  custom_tag = {
    Name       = "chamo-1971-static-website"
    Enviroment = "dev"
  }
}
