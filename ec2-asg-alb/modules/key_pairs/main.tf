resource "tls_private_key" "this" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
}

resource "local_file" "this" {
  filename        = var.filename
  file_permission = var.file_permission
  content         = tls_private_key.this.private_key_pem
}
