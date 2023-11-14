resource "aws_db_instance" "this" {
  identifier_prefix       = var.identifier_prefix
  instance_class          = var.instance_class
  skip_final_snapshot     = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period
  replicate_source_db     = var.replicate_source_db
  engine                  = var.replicate_source_db == null ? var.engine : null
  port                    = var.replicate_source_db == null ? var.port : null
  db_name                 = var.replicate_source_db == null ? var.db_name : null
  username                = var.replicate_source_db == null ? var.username : null
  password                = var.replicate_source_db == null ? var.password : null
  allocated_storage       = var.replicate_source_db == null ? var.allocated_storage : null
  
  tags = var.custom_tag
}