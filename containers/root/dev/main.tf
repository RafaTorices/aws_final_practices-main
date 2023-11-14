module "s3" {
  source = "../../modules/s3"

  bucket        = "chamo-container-s3-demo"
  force_destroy = true

  files = {
    happy-cat = {
      "key" : "img/${var.filename}"
      "source" : "../src/img_src/${var.filename}"
      "source_hash" : "../src/img_src/${var.filename}"
      "content_type" : "image/png"
    }
  }

  custom_tag = {
    Name       = "chamo-container-s3-demo"
    Enviroment = "dev"
  }
}

module "docker_image" {
  source = "../../modules/docker"

  providers = {
    docker = docker
  }

  name     = var.name
  context  = "../src"
  tag      = "${local.ecr_reg}/${var.name}:${var.tag}"
  platform = var.platform
}

module "aws_ecr" {
  source = "../../modules/ecr"

  name                = module.docker_image.name
  ecr_reg             = local.ecr_reg
  image_name          = module.docker_image.name
  image_tag           = module.docker_image.tag[0][0]
  image_src_path      = module.docker_image.context[0]
  force_delete        = true
  scan_on_push        = true
  force_image_rebuild = true
}

module "ecs_execution_role" {
  source = "../../modules/iam"

  role_name = "ecs-execution-role"
  policy_arn = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  ]

  custom_tag = {
    Name       = "ecs-execution-role"
    Enviroment = "dev"
  }
}

module "ecs_task_role" {
  source = "../../modules/iam"

  role_name = "ecs-task-role"
  policy_arn = [
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  ]

  custom_tag = {
    Name       = "ecs-task-role"
    Enviroment = "dev"
  }
}

module "sg" {
  source = "../../modules/security_groups"

  name        = "ecs-security-group"
  description = "ECS Security Group"
  rules = {
    http = {
      "type" : "ingress"
      "from_port" : 80
      "to_port" : 80
      "protocol" : "tcp"
      "cidr_blocks" : ["0.0.0.0/0"]
    },
    egress = {
      "type" : "egress"
      "from_port" : 0
      "to_port" : 0
      "protocol" : "-1"
      "cidr_blocks" : ["0.0.0.0/0"]
    }
  }
}

module "alb" {
  source = "../../modules/alb"

  alb_name           = "ecs-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.sg.id]

  alb_tags = {
    Name       = "ecs-alb"
    Enviroment = "dev"
  }

  alb_tg_name           = "ecs-alb-tg"
  alb_tg_port           = 80
  alb_tg_protocol       = "HTTP"
  target_type           = "ip"
  healthy_threshold     = "3"
  interval              = "30"
  health_check_protocol = "HTTP"
  matcher               = "200"
  timeout               = "3"
  path                  = "/"
  unhealthy_threshold   = "2"

  alb_tg_tags = {
    Name       = "alb_target_group"
    Enviroment = "dev"
  }

  alb_listener_port     = 80
  alb_listener_protocol = "HTTP"
  alb_listener_type     = "forward"
}

module "ecs" {
  source = "../../modules/ecs"

  cluster_name          = "chamo"
  execution_role_arn    = module.ecs_execution_role.role_arn
  capacity_providers    = "FARGATE"
  awslogs-group         = "happy-cat-ecs-logs-group"
  awslogs-stream-prefix = "happy-cat-ecs-stream"
  awslogs-region        = data.aws_region.current.name

  family          = "happy-cat-service"
  image           = module.docker_image.tag[0][0]
  memory          = 512
  cpu             = 256
  essential       = true
  environment     = local.happy_cat.environment
  task_role_arn   = module.ecs_task_role.role_arn
  protocol        = "tcp"
  container_name  = module.docker_image.name
  container_port  = "80"
  hostPort        = "80"
  security_groups = module.sg.id

  requires_compatibilities = "FARGATE"
  network_mode             = "awsvpc"

  service_name  = "happy-cat-svc"
  launch_type   = "FARGATE"
  desired_count = 6

  target_group_arn = module.alb.target_group_arn
}

module "logs" {
  source = "../../modules/log_group"

  log_group_name  = "happy-cat-ecs-logs-group"
  log_stream_name = "happy-cat-ecs-stream"
}