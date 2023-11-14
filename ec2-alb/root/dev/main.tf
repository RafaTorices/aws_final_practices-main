module "key_pairs" {
  source = "../../modules/key_pairs"

  key_name = "webserver"
  filename = "${path.root}/webserver.pem"
}

module "webserver" {
  source = "../../modules/ec2"

  user_data              = "${path.root}/user-data.txt"
  vpc_security_group_ids = module.sg_webserver.id
  key_name               = module.key_pairs.key_name
  tag_value              = "webserver"
}

module "sg_webserver" {
  source = "../../modules/security_groups"

  name        = "Webserver_SG"
  description = "Webserver Security Groups"

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

  name        = "ALB_SG"
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

  alb_tg_name           = "Webserver-TG"
  alb_tg_port           = "80"
  alb_tg_protocol       = "HTTP"
  alb_tg_target_id      = module.webserver.ec2_id
  healthy_threshold     = "5"
  unhealthy_threshold   = "2"
  health_check_protocol = "HTTP"
  interval              = "30"
  matcher               = "200"
  timeout               = "5"
  path                  = "/"

  alb_tg_tags = {
    "Name" : "Webserver-TG"
    "Enviroment" : "Dev"
  }

  alb_name              = "Webserver-ALB"
  alb_listener_port     = "80"
  alb_listener_protocol = "HTTP"
  alb_listener_type     = "forward"
  internal              = false
  security_groups       = module.sg_alb.id

  alb_tags = {
    "Name" : "Webserver-ALB"
    "Enviroment" : "Dev"
  }
}