terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  alias  = "primary"

  default_tags {
    tags = {
      Owner     = "Chamo"
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
  alias  = "replica"

  default_tags {
    tags = {
      Owner     = "Chamo"
      ManagedBy = "Terraform"
    }
  }
}