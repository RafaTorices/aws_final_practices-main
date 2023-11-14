[//]: # (BEGIN_TF_DOCS)
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement_aws) | =4.65.0 |
| <a name="requirement_tls"></a> [tls](#requirement_tls) | 4.0.4 |

#### Providers

No providers.

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cyber_resources"></a> [cyber_resources](#module_cyber_resources) | ./modules/cyber | n/a |
| <a name="module_github_iam"></a> [github_iam](#module_github_iam) | ./modules/github_iam | n/a |
| <a name="module_iam_users"></a> [iam_users](#module_iam_users) | ./modules/iam_users | n/a |

#### Resources

No resources.

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_cyber_bootcamp_edition"></a> [cyber_bootcamp_edition](#input_cyber_bootcamp_edition) | Edition of the bootcamp that will use the resources | `number` |
| <a name="input_cyber_bootcamp_name"></a> [cyber_bootcamp_name](#input_cyber_bootcamp_name) | Name of the bootcamp that will use the resources | `string` |
| <a name="input_cyber_ec2_instance_allowed_ips_ssh"></a> [cyber_ec2_instance_allowed_ips_ssh](#input_cyber_ec2_instance_allowed_ips_ssh) | Allowed IPs to connect via ssh to EC2 instance | `list(string)` |
| <a name="input_cyber_ec2_instance_size"></a> [cyber_ec2_instance_size](#input_cyber_ec2_instance_size) | EC2 instance EBS volume size for cyber bootcamp | `number` |
| <a name="input_cyber_ec2_instance_type"></a> [cyber_ec2_instance_type](#input_cyber_ec2_instance_type) | EC2 instance type like t2.medium, t3.micro, etc for cyber bootcamp | `string` |
| <a name="input_cyber_ec2_instances"></a> [cyber_ec2_instances](#input_cyber_ec2_instances) | List of EC2 instances to create | `list(string)` |
| <a name="input_cyber_vpc_azs"></a> [cyber_vpc_azs](#input_cyber_vpc_azs) | List of AZs to use for VPC of cyber | `list(string)` |
| <a name="input_cyber_vpc_cidr"></a> [cyber_vpc_cidr](#input_cyber_vpc_cidr) | VPC CIDR for cyber | `string` |
| <a name="input_cyber_vpc_nat_gateways_number"></a> [cyber_vpc_nat_gateways_number](#input_cyber_vpc_nat_gateways_number) | Number of NAT Gateways for the VPC of cyber | `number` |
| <a name="input_cyber_vpc_private_subnets"></a> [cyber_vpc_private_subnets](#input_cyber_vpc_private_subnets) | List of CIDRs for private subnets of cyber VPC | `list(string)` |
| <a name="input_cyber_vpc_public_subnets"></a> [cyber_vpc_public_subnets](#input_cyber_vpc_public_subnets) | List of CIDRs for public subnets of cyber VPC | `list(string)` |
| <a name="input_github_iam_role_name"></a> [github_iam_role_name](#input_github_iam_role_name) | Name of the IAM role to be created. This will be assumable by GitHub. | `string` |
| <a name="input_github_iam_role_path"></a> [github_iam_role_path](#input_github_iam_role_path) | Path under which to create IAM role. | `string` |
| <a name="input_github_iam_tags"></a> [github_iam_tags](#input_github_iam_tags) | Map of tags to be applied to all resources. | `map(string)` |
| <a name="input_github_repositories"></a> [github_repositories](#input_github_repositories) | List of GitHub organization/repository names authorized to assume the role. | `list(string)` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instances_info"></a> [ec2_instances_info](#output_ec2_instances_info) | Cyber ec2 instances info |
| <a name="output_github_iam_role_arn"></a> [github_iam_role_arn](#output_github_iam_role_arn) | ARN of the IAM role for GitHub |
| <a name="output_iam_user_info"></a> [iam_user_info](#output_iam_user_info) | IAM Users Info |

[//]: # (END_TF_DOCS)
