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

module "react_site" {
  source = "./modules/react_site"

  # Ensure the bucket name is globally unique on S3
  bucket_name = "my-react-static-website-unique-7689"

  # This path points to your built React app files.
  # Make sure to run "npm run build" inside the react directory so that this folder exists.
  website_source_dir = "../react/build"
}