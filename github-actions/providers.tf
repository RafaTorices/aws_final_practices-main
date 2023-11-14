provider "aws" {
  region = "eu-north-1"

  default_tags {
    tags = {
      Created         = "Terraform"
      Owner           = "KeepCoding"
      BootCampEdition = "8"
    }
  }
}
