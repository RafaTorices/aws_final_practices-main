output "users_info" {
  description = "IAM Users Info"
  sensitive   = true
  value = try(merge([
    for bootcamp_users in var.kc_users : {
      for user in bootcamp_users["users"] :
      user.user_name =>
      {
        "access_key_id" : module.iam_user[user.user_name].iam_access_key_id,
        "access_key_secret" : module.iam_user[user.user_name].iam_access_key_secret,
        "group" : aws_iam_group.group[bootcamp_users.name].name,
        "console_login_password" : module.iam_user[user.user_name].iam_user_login_profile_password
      }
  }]...), "")
}
