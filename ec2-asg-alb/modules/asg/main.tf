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

  dynamic "tag" {
    for_each = local.custom_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
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

resource "aws_launch_template" "this" {
  name                   = var.lt_name
  image_id               = data.aws_ami.amazon.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = filebase64(var.user_data)
  vpc_security_group_ids = [var.vpc_security_group_ids]

  iam_instance_profile {
    arn = aws_iam_instance_profile.this.arn
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.tag_value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  name                = var.asg_name
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = data.aws_subnets.this.ids
  target_group_arns   = [var.target_group_arns]

  health_check_type = "ELB"

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.tag_value
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = var.lb_target_group_arn
}