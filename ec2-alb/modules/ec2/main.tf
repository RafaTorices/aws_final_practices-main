resource "aws_iam_policy" "this" {
  name   = "${var.tag_value}-policy"
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role" "this" {
  name = "${var.tag_value}-role"

  assume_role_policy = <<-EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOT

  tags = {
    Name = "${var.tag_value}-role"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${var.tag_value}-profile"
  role = aws_iam_role.this.name
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.this.id
  instance_type          = var.instance_type
  user_data              = file(var.user_data)
  key_name               = var.key_name
  iam_instance_profile   = aws_iam_instance_profile.this.id
  vpc_security_group_ids = [var.vpc_security_group_ids]

  tags = {
    Name = var.tag_value
  }
}
