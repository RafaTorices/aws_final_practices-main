resource "aws_ecs_cluster" "this" {
  name = var.cluster_name

  tags = var.tags
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = [var.capacity_providers]

  default_capacity_provider_strategy {
    base              = var.base
    weight            = var.weight
    capacity_provider = var.capacity_provider
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.family
  requires_compatibilities = [var.requires_compatibilities]
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn


  container_definitions = jsonencode([
    {
      name        = var.container_name
      image       = var.image
      cpu         = var.cpu
      memory      = var.memory
      essential   = var.essential
      environment = var.environment

      portMappings = [
        {
          protocol      = var.protocol
          containerPort = var.containerPort
          hostPort      = var.hostPort
        }
      ]

      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group         = var.awslogs-group,
          awslogs-stream-prefix = var.awslogs-stream-prefix,
          awslogs-region        = var.awslogs-region
        }
      }
    }
  ])
}

resource "aws_ecs_service" "this" {
  name                 = var.service_name
  cluster              = aws_ecs_cluster.this.id
  task_definition      = "${aws_ecs_task_definition.this.family}:${max(aws_ecs_task_definition.this.revision, data.aws_ecs_task_definition.this.revision)}"
  launch_type          = var.launch_type
  scheduling_strategy  = var.scheduling_strategy
  desired_count        = var.desired_count
  force_new_deployment = var.force_new_deployment

  network_configuration {
    subnets          = data.aws_subnets.this.ids
    assign_public_ip = var.assign_public_ip
    security_groups  = [var.security_groups]
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}
