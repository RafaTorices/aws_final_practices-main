module "primary" {
  source = "../../modules/rds"

  providers = {
    aws = aws.primary
  }

  identifier_prefix = "chamo-primary"
  db_name           = "chamo_demo"
  username          = "admin"
  password          = "SuperMegaPassword"

  custom_tag = {
    Name       = "rds-primary"
    Enviroment = "dev"
  }
}

module "replica" {
  source = "../../modules/rds"

  providers = {
    aws = aws.replica
  }

  identifier_prefix   = "chamo-replica"
  replicate_source_db = module.primary.arn

  custom_tag = {
    Name       = "rds-replica"
    Enviroment = "dev"
  }
}