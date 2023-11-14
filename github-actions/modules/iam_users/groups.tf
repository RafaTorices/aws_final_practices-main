resource "aws_iam_group" "group" {
  for_each = { for bootcamp in var.kc_users : bootcamp.name => bootcamp }
  name     = each.key
  path     = "/${each.key}/"

  depends_on = [
    module.iam_user
  ]
}

resource "aws_iam_group_policy_attachment" "group" {
  for_each   = { for bootcamp in var.kc_users : bootcamp.name => bootcamp }
  group      = aws_iam_group.group[each.key].name
  policy_arn = data.aws_iam_policy.admin.arn
}

resource "aws_iam_user_group_membership" "user_group_membership" {
  for_each = {
    for user in local.users : user.user_name => user
  }

  user = module.iam_user[each.key].iam_user_name
  groups = [
    aws_iam_group.group[each.value.bootcamp].name,
  ]

  depends_on = [module.iam_user]
}
