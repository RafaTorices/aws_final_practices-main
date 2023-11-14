locals {
  kc_users_filename = "kc_users.yaml"
  kc_users          = yamldecode(file("${path.module}/${local.kc_users_filename}"))
}
