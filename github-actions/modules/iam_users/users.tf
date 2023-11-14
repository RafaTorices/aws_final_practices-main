module "iam_user" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"

  for_each = {
    for user in local.users : user.user_name => user
  }

  name                    = each.value.user_name
  force_destroy           = true
  password_reset_required = true

  tags = {
    Bootcamp = each.value.bootcamp
    Email    = each.value.email
    Name     = each.value.name
  }

  version = "5.17.0"
}
