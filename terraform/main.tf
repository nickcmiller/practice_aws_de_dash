terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-config-8686"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}

module "cost_explorer_lambda" {
  source = "./modules/lambda"

  function_name    = "cost-explorer"
  lambda_role_name = "cost_explorer_lambda_role"
  lambda_source_dir = "../lambda"
  
  tags = {
    Environment = "production"
    Service     = "cost-monitoring"
  }
}