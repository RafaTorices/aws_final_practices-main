resource "aws_iam_role" "this" {
  name               = var.role_name
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.this.json

  tags = var.custom_tag
}

resource "aws_iam_policy" "this" {
  count       = var.create_policy ? 1 : 0
  
  name        = var.policy_name
  description = var.policy_description
  policy      = var.policy

  tags = var.custom_tag
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.policy_arn)
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arn[count.index]
}

