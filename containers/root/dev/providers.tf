terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.14"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Owner     = "Chamo"
      ManagedBy = "Terraform"
    }
  }
}