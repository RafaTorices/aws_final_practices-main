module "key_pairs" {
  source = "../../modules/key_pairs"

  key_name = "webserver"
  filename = "${path.root}/webserver.pem"
}

module "webserver" {
  source = "../../modules/asg"

  lt_name                = "webserver-lt"
  key_name               = module.key_pairs.key_name
  vpc_security_group_ids = module.sg_webserver.id
  user_data              = "${path.root}/user-data.txt"
  asg_name               = "webserver-asg"
  min_size               = 2
  max_size               = 6
  desired_capacity       = 3
  tag_value              = "webserver"
  target_group_arns      = module.alb.alb_tg_arn
  lb_target_group_arn    = module.alb.alb_tg_arn
}

module "sg_webserver" {
  source = "../../modules/security_groups"

  name        = "webserver-security-group"
  description = "Webserver Security Group"

  rules = [
    {
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [local.my_ip]
      description = "ingress from my public ip"
    },
    {
      type                     = "ingress"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      source_security_group_id = module.sg_alb.id
      description              = "ingress from load balancer"
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "egress from all"
    }
  ]
}

module "sg_alb" {
  source = "../../modules/security_groups"

  name        = "alb-security-group"
  description = "Application Load Balancer Security Groups"

  rules = [
    {
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "ingress from world"
    },
    {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "egress from all"
    }
  ]
}

module "alb" {
  source = "../../modules/alb"

  alb_tg_name           = "webserver-tg"
  alb_tg_port           = "80"
  alb_tg_protocol       = "HTTP"
  healthy_threshold     = "5"
  unhealthy_threshold   = "2"
  health_check_protocol = "HTTP"
  interval              = "30"
  matcher               = "200"
  timeout               = "5"
  path                  = "/"

  alb_tg_tags = {
    Name       = "webserver-tg"
    Enviroment = "dev"
  }

  alb_name              = "webserver-alb"
  alb_listener_port     = "80"
  alb_listener_protocol = "HTTP"
  alb_listener_type     = "forward"
  internal              = false
  security_groups       = module.sg_alb.id

  alb_tags = {
    Name       = "webserver-alb"
    Enviroment = "dev"
  }
}