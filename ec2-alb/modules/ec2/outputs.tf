output "ec2_id" {
  description = "EC2 ID"
  value       = aws_instance.this.id
}

output "ec2_public_ip" {
  description = "EC2 Public IP"
  value       = aws_instance.this.public_ip
}

output "ec2_public_dns" {
  description = "EC2 Public DNS"
  value       = aws_instance.this.public_dns
}

output "ec2_tags" {
  description = "EC2 Instance Tags"
  value       = aws_instance.this.tags_all
}

output "ec2_instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.this.id
}

output "ec2_instance_ami" {
  description = "EC2 Instance AMI"
  value       = aws_instance.this.ami
}

output "last_amazon_linux_ami_name" {
  description = "Get Last Amazon Linux AMI Name"
  value       = data.aws_ami.this.name
}
