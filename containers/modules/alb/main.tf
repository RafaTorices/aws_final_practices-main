resource "aws_alb" "this" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets            = data.aws_subnets.this.ids
  security_groups    = var.security_groups

  tags = var.alb_tg_tags
}

resource "aws_lb_target_group" "this" {
  name        = var.alb_tg_name
  port        = var.alb_tg_port
  protocol    = var.alb_tg_protocol
  target_type = var.target_type
  vpc_id      = data.aws_vpc.default_vpc.id

  health_check {
    healthy_threshold   = var.healthy_threshold
    interval            = var.interval
    protocol            = var.health_check_protocol
    matcher             = var.matcher
    timeout             = var.timeout
    path                = var.path
    unhealthy_threshold = var.unhealthy_threshold
  }

  tags = var.alb_tg_tags
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_alb.this.id
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type             = var.alb_listener_type
    target_group_arn = aws_lb_target_group.this.id
  }
}
