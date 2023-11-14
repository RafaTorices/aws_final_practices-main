data "aws_iam_policy_document" "this" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      module.static_website_s3.arn,
      "${module.static_website_s3.arn}/*"
    ]
  }
}