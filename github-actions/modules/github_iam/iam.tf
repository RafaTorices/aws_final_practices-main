resource "aws_iam_role" "github" {
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  description        = "Role assumed by the GitHub OIDC provider."
  name               = var.iam_role_name
  tags               = var.tags
  path               = var.iam_role_path
}

resource "aws_iam_role_policy_attachment" "admin" {
  policy_arn = "arn:${local.partition}:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.github.id
}

resource "aws_iam_openid_connect_provider" "github" {
  client_id_list = local.client_id_list

  tags = var.tags
  url  = "https://token.actions.githubusercontent.com"
  thumbprint_list = [
    data.tls_certificate.github.certificates[0].sha1_fingerprint
  ]
}
