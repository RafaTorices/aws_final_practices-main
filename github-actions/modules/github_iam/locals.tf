locals {
  github_organizations = toset([for repo in var.github_repositories : split("/", repo)[0]])
  oidc_provider_arn    = aws_iam_openid_connect_provider.github.arn
  partition            = data.aws_partition.current.partition
  client_id_list = concat(
    ["sts.amazonaws.com"],
    [for org in local.github_organizations : "https://github.com/${org}"]
  )
}
