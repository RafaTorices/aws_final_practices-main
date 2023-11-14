terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=4.65.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
  backend "s3" {
    bucket = "keepcoding-infrastructure"
    key    = "infra-as-code.tfstate"
    region = "eu-north-1"
  }
}
