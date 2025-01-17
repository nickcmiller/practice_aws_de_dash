terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-config-8686"
    region         = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}
