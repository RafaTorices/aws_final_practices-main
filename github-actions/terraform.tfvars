// GitHub IAM module variables
github_repositories = [
  "KeepCodingCloudDevops8/infra-as-code"
]
github_iam_role_name = "github_actions"
github_iam_role_path = "/github/"

# Cyber module variables
cyber_bootcamp_name           = "cyber"
cyber_bootcamp_edition        = 11
cyber_vpc_azs                 = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
cyber_vpc_cidr                = "10.0.0.0/16"
cyber_vpc_nat_gateways_number = 1
cyber_vpc_private_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
cyber_vpc_public_subnets      = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
cyber_ec2_instance_type       = "m5.large"
cyber_ec2_instances           = ["fame-1", "fame-2", "fame-3"]
cyber_ec2_instance_allowed_ips_ssh = [
  "37.35.217.59/32",
  "81.40.89.23/32"
]
