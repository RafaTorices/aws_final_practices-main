variable "github_repositories" {
  description = "List of GitHub organization/repository names authorized to assume the role."
  type        = list(string)

  validation {
    // Ensures each element of github_repositories list matches the
    // organization/repository format used by GitHub.
    condition = length([
      for repo in var.github_repositories : 1
      if length(regexall("^[A-Za-z0-9_.-]+?/([A-Za-z0-9_.:/-]+[*]?|\\*)$", repo)) > 0
    ]) == length(var.github_repositories)
    error_message = "Repositories must be specified in the organization/repository format."
  }
}

variable "github_iam_role_name" {
  default     = "github"
  description = "Name of the IAM role to be created. This will be assumable by GitHub."
  type        = string
}

variable "github_iam_role_path" {
  default     = "/"
  description = "Path under which to create IAM role."
  type        = string
}

variable "github_iam_tags" {
  default     = {}
  description = "Map of tags to be applied to all resources."
  type        = map(string)
}

// Cyber module variables

variable "cyber_bootcamp_name" {
  description = "Name of the bootcamp that will use the resources"
  type        = string
  default     = "cyber"
}

variable "cyber_bootcamp_edition" {
  description = "Edition of the bootcamp that will use the resources"
  type        = number
  default     = 11
}

# VPC CIDR
variable "cyber_vpc_cidr" {
  description = "VPC CIDR for cyber"
  type        = string
  default     = ""
}

# VPC Number of NAT Gateways
variable "cyber_vpc_nat_gateways_number" {
  description = "Number of NAT Gateways for the VPC of cyber"
  type        = number
  default     = 1
}

# VPC private subnets CIDRs
variable "cyber_vpc_private_subnets" {
  description = "List of CIDRs for private subnets of cyber VPC"
  type        = list(string)
  default     = [""]
}

# VPC public subnets CIDRs
variable "cyber_vpc_public_subnets" {
  description = "List of CIDRs for public subnets of cyber VPC"
  type        = list(string)
  default     = [""]
}

# VPC AZs
variable "cyber_vpc_azs" {
  description = "List of AZs to use for VPC of cyber"
  type        = list(string)
  default     = []
}

# EC2 number
variable "cyber_ec2_instances" {
  description = "List of EC2 instances to create"
  type        = list(string)
  default     = [""]
}

# EC2 instance type
variable "cyber_ec2_instance_type" {
  description = "EC2 instance type like t2.medium, t3.micro, etc for cyber bootcamp"
  type        = string
  default     = "t3.micro"
}

# EC2 EBS size
variable "cyber_ec2_instance_size" {
  description = "EC2 instance EBS volume size for cyber bootcamp"
  type        = number
  default     = 30
}

# EC2 Allow IP for ssh

variable "cyber_ec2_instance_allowed_ips_ssh" {
  description = "Allowed IPs to connect via ssh to EC2 instance"
  type        = list(string)
}
