locals {
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"

  custom_tags = {
    Owner     = "Chamo"
    ManagedBy = "Terraform"
  }
}
