locals {
  users = merge([
    for bootcamp_users in var.kc_users : {
      for user in bootcamp_users["users"] :
      user.user_name =>
      {
        bootcamp  = bootcamp_users["name"]
        email     = user.email
        name      = user.name
        user_name = user.user_name
      }
    }
  ]...)
}
