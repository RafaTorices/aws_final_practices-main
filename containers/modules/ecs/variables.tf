variable "cluster_name" {
  description = "ECS Cluster Name"
  type        = string
  default     = null
}

variable "tags" {
  description = "ECS Cluster Tags"
  type        = map(any)
  default     = {}
}

variable "capacity_providers" {
  description = "ECS Cluster Capacity Providers"
  type        = string
  default     = "FARGATE"
}

variable "base" {
  description = "ECS Default Capacity Providers Base"
  type        = number
  default     = 1
}

variable "weight" {
  description = "ECS Default Capacity Providers Weight"
  type        = number
  default     = 100
}

variable "capacity_provider" {
  description = "ECS Cluster Capacity Provider"
  type        = string
  default     = "FARGATE"
}

variable "family" {
  description = "ECS Task Definition Family"
  type        = string
  default     = null
}

variable "image" {
  description = "ECS Task Definition Image"
  type        = string
  default     = null
}
variable "cpu" {
  description = "ECS Task Definition CPU"
  type        = number
  default     = 256
}

variable "memory" {
  description = "ECS Task Definition Memory"
  type        = number
  default     = 512
}

variable "essential" {
  description = "ECS Task Definition Essential"
  type        = bool
  default     = true
}

variable "environment" {
  description = "ECS Task Definition Environment Vars"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "task_role_arn" {
  description = "ECS Task Definition Task Role ARN"
  type        = string
  default     = null
}

variable "protocol" {
  description = "ECS Task Definition Protocol"
  type        = string
  default     = "tcp"
}

variable "containerPort" {
  description = "ECS Container Port"
  type        = number
  default     = 80
}

variable "hostPort" {
  description = "ECS Host Port"
  type        = number
  default     = 80
}

variable "requires_compatibilities" {
  description = "ECS Require Compatibilities"
  type        = string
  default     = "FARGATE"
}

variable "network_mode" {
  description = "ECS Network Mode"
  type        = string
  default     = "awsvpc"
}

variable "service_name" {
  description = "ECS Service Name"
  type        = string
  default     = null
}

variable "launch_type" {
  description = "ECS Service Launch Type"
  type        = string
  default     = "FARGATE"
}

variable "scheduling_strategy" {
  description = "ECS Service Scheduling Strategy"
  type        = string
  default     = "REPLICA"
}

variable "desired_count" {
  description = "ECS Service Desired Count"
  type        = number
  default     = 1
}

variable "force_new_deployment" {
  description = "ECS Service Force a New Deployment"
  type        = bool
  default     = true
}

variable "assign_public_ip" {
  description = "ECS Service Assign a Public IP"
  type        = bool
  default     = true
}

variable "security_groups" {
  description = "ECS Service Security Groups"
  type        = string
  default     = null
}

variable "target_group_arn" {
  description = "ECS Service ARN Target Group"
  type        = string
  default     = null
}

variable "container_name" {
  description = "ECS Service Container Name"
  type        = string
  default     = "hello"
}

variable "container_port" {
  description = "ECS Service Container Port"
  type        = number
  default     = 80
}

variable "max_capacity" {
  description = "ECS Auto Scaling Target Max Capacity"
  type        = number
  default     = 2
}

variable "min_capacity" {
  description = "ECS Auto Scaling Target Min Capacity"
  type        = number
  default     = 1
}

variable "execution_role_arn" {
  description = "ECS Excecution Role ARN"
  type        = string
  default     = null
}

variable "awslogs-group" {
  description = "ECS CloudWatch Logs Group Name"
  type        = string
  default     = null
}

variable "awslogs-stream-prefix" {
  description = "ECS CloudWatch Logs Group Prefix"
  type        = string
  default     = null
}

variable "awslogs-region" {
  description = "ECS CloudWatch Logs Group Region"
  type        = string
  default     = null
}
