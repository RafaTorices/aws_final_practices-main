module "github_iam" {
  source = "./modules/github_iam"

  iam_role_name       = var.github_iam_role_name
  iam_role_path       = var.github_iam_role_path
  github_repositories = var.github_repositories
  tags                = var.github_iam_tags

  providers = {
    aws = aws
  }
}

module "iam_users" {
  source = "./modules/iam_users"

  kc_users = local.kc_users

  depends_on = [
    module.github_iam
  ]
}

module "cyber_resources" {
  source = "./modules/cyber"

  bootcamp_edition             = var.cyber_bootcamp_edition
  bootcamp_name                = var.cyber_bootcamp_name
  vpc_azs                      = var.cyber_vpc_azs
  vpc_cidr                     = var.cyber_vpc_cidr
  vpc_nat_gateways_number      = var.cyber_vpc_nat_gateways_number
  vpc_private_subnets          = var.cyber_vpc_private_subnets
  vpc_public_subnets           = var.cyber_vpc_public_subnets
  ec2_instance_type            = var.cyber_ec2_instance_type
  ec2_instances                = var.cyber_ec2_instances
  ec2_instance_size            = var.cyber_ec2_instance_size
  ec2_instance_allowed_ips_ssh = var.cyber_ec2_instance_allowed_ips_ssh

  depends_on = [
    module.iam_users
  ]
}
