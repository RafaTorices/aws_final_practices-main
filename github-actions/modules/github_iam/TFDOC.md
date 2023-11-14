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

No modules.

#### Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.admin](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/4.65.0/docs/data-sources/partition) | data source |
| [tls_certificate.github](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/data-sources/certificate) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_github_repositories"></a> [github_repositories](#input_github_repositories) | List of GitHub organization/repository names authorized to assume the role. | `list(string)` |
| <a name="input_iam_role_name"></a> [iam_role_name](#input_iam_role_name) | Name of the IAM role to be created. This will be assumable by GitHub. | `string` |
| <a name="input_iam_role_path"></a> [iam_role_path](#input_iam_role_path) | Path under which to create IAM role. | `string` |
| <a name="input_tags"></a> [tags](#input_tags) | Map of tags to be applied to all resources. | `map(string)` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam_role_arn](#output_iam_role_arn) | ARN of the IAM role. |

[//]: # (END_TF_DOCS)
