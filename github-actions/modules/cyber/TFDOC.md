[//]: # (BEGIN_TF_DOCS)
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement_aws) | =4.65.0 |
| <a name="requirement_tls"></a> [tls](#requirement_tls) | 4.0.4 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.65.0 |
| <a name="provider_tls"></a> [tls](#provider_tls) | 4.0.4 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_instance"></a> [ec2_instance](#module_ec2_instance) | terraform-aws-modules/ec2-instance/aws | 5.0.0 |
| <a name="module_vpc"></a> [vpc](#module_vpc) | terraform-aws-modules/vpc/aws | 4.0.1 |

#### Resources

| Name | Type |
|------|------|
| [aws_eip.ec2_eip](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/eip) | resource |
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/eip) | resource |
| [aws_key_pair.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/key_pair) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_object.ssh_key](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_ownership_controls.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_versioning.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/security_group) | resource |
| [tls_private_key.main](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/resources/private_key) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/ami) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_bootcamp_edition"></a> [bootcamp_edition](#input_bootcamp_edition) | Edition of the bootcamp that will use the resources | `number` |
| <a name="input_bootcamp_name"></a> [bootcamp_name](#input_bootcamp_name) | Name of the bootcamp that will use the resources | `string` |
| <a name="input_ec2_instance_allowed_ips_ssh"></a> [ec2_instance_allowed_ips_ssh](#input_ec2_instance_allowed_ips_ssh) | Allowed IPs to connect via SSH to EC2 instance | `list(string)` |
| <a name="input_ec2_instance_size"></a> [ec2_instance_size](#input_ec2_instance_size) | EC2 instance EBS volume size | `number` |
| <a name="input_ec2_instance_type"></a> [ec2_instance_type](#input_ec2_instance_type) | EC2 instance type like t2.medium, t3.micro, etc | `string` |
| <a name="input_ec2_instances"></a> [ec2_instances](#input_ec2_instances) | List of EC2 instances to create | `list(string)` |
| <a name="input_vpc_azs"></a> [vpc_azs](#input_vpc_azs) | List of AZs to use for VPC | `list(string)` |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr) | VPC CIDR | `string` |
| <a name="input_vpc_nat_gateways_number"></a> [vpc_nat_gateways_number](#input_vpc_nat_gateways_number) | Number of NAT Gateways for the VPC | `number` |
| <a name="input_vpc_private_subnets"></a> [vpc_private_subnets](#input_vpc_private_subnets) | List of CIDRs for private subnets | `list(string)` |
| <a name="input_vpc_public_subnets"></a> [vpc_public_subnets](#input_vpc_public_subnets) | List of CIDRs for public subnets | `list(string)` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_instances_info"></a> [ec2_instances_info](#output_ec2_instances_info) | Cyber ec2 instances info |

[//]: # (END_TF_DOCS)
