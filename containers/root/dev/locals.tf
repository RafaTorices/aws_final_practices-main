locals {
  ecr_reg = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"

  task_environment = tomap(merge(
    {
      BUCKET = module.s3.bucket
    },
    {
      KEY = "img/cat.png"
    },
    { for i, v in var.environment : i => v if i != null }
  ))

  happy_cat = {
    environment = [
      for name, value in local.task_environment : {
        name  = name
        value = value
      }
    ]
  }
}
