module "s3" {
  source = "../../modules/s3"

  bucket = "chamo-butic-1971-serverless"

  files = {
    lambda_create = {
      "key" : var.create_zip
      "source" : "${path.root}/zip/${var.create_zip}"
      "source_hash" : "${path.root}/zip/${var.create_zip}"
      "content_type" : "application/zip"
    },
    lambda_delete = {
      "key" : var.delete_zip
      "source" : "${path.root}/zip/${var.delete_zip}"
      "source_hash" : "${path.root}/zip/${var.delete_zip}"
      "content_type" : "application/zip"
    },
    lambda_read = {
      "key" : var.read_zip
      "source" : "./zip/${var.read_zip}"
      "source_hash" : "${path.root}/zip/${var.read_zip}"
      "content_type" : "application/zip"
    },
    lambda_update = {
      "key" : var.update_zip
      "source" : "./zip/${var.update_zip}"
      "source_hash" : "${path.root}/zip/${var.update_zip}"
      "content_type" : "application/zip"
    }
  }

  tags = {
    "Name" : "chamo-butic-1971-serverless"
  }
}

module "api" {
  source = "../../modules/api_gateway"

  name          = "API Serverless"
  protocol_type = "HTTP"

  apis = {
    create = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_create.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "POST /items"
    },
    delete = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_delete.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "DELETE /items/{id}"
    },
    read_all = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_read.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "GET /items"
    },
    read_one = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_read.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "GET /items/{id}"
    },
    update = {
      integration_type       = "AWS_PROXY"
      connection_type        = "INTERNET"
      integration_method     = "POST"
      integration_uri        = module.lambda_update.invoke_arn
      passthrough_behavior   = "WHEN_NO_MATCH"
      payload_format_version = "2.0"
      route_key              = "PUT /items/{id}"
    }
  }

}

module "lambda_create" {
  source = "../../modules/lambda"

  function_name = "lambda_create"
  s3_bucket     = module.s3.s3_bucket
  s3_key        = var.create_zip
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  policy_name   = "lambda_create_policy"
  role_name     = "lambda_create_role"
  permissions = {
    create = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/POST/items"
    }
  }
}

module "lambda_delete" {
  source = "../../modules/lambda"

  function_name = "lambda_delete"
  s3_bucket     = module.s3.s3_bucket
  s3_key        = var.delete_zip
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  policy_name   = "lambda_delete_policy"
  role_name     = "lambda_delete_role"
  permissions = {
    delete = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/DELETE/items/{id}"
    }
  }
}

module "lambda_read" {
  source = "../../modules/lambda"

  function_name = "lambda_read"
  s3_bucket     = module.s3.s3_bucket
  s3_key        = var.read_zip
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  policy_name   = "lambda_read_policy"
  role_name     = "lambda_read_role"

  permissions = {
    read_all = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/GET/items"
    },
    read_one = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/GET/items/{id}"
    }
  }

}

module "lambda_update" {
  source = "../../modules/lambda"

  function_name = "lambda_update"
  s3_bucket     = module.s3.s3_bucket
  s3_key        = var.update_zip
  handler       = "main.lambda_handler"
  runtime       = "python3.10"
  policy_name   = "lambda_update_policy"
  role_name     = "lambda_update_role"
  permissions = {
    update = {
      action     = "lambda:InvokeFunction"
      principal  = "apigateway.amazonaws.com"
      source_arn = "${module.api.execution_arn}/*/PUT/items/{id}"
    }
  }
}

module "dynamodb" {
  source = "../../modules/dynamodb"

  name     = "serverless_dynamodb"
  hash_key = "id"

  attributes = {
    id = {
      name = "id"
      type = "S"
    }
  }
}