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

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_user"></a> [iam_user](#module_iam_user) | terraform-aws-modules/iam/aws//modules/iam-user | 5.17.0 |

#### Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.group](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_user_group_membership.user_group_membership](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_policy.admin](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/iam_policy) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_kc_users"></a> [kc_users](#input_kc_users) | List of keepcoding users by bootcamp | `list(any)` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_users_info"></a> [users_info](#output_users_info) | IAM Users Info |

[//]: # (END_TF_DOCS)
