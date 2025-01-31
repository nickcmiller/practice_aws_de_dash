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

# ------------------------------
# Add a Lambda execution IAM role
# ------------------------------
resource "aws_iam_role" "lambda_exec" {
  name = "hello_world_lambda_role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ------------------------------
# Create a zip archive of the lambda function code
# ------------------------------
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "../lambda"        # folder containing the lambda_function.py file
  output_path = "lambda_function_payload.zip"
}

# ------------------------------
# Create the Lambda Function resource
# ------------------------------
resource "aws_lambda_function" "hello_world" {
  function_name = "helloWorld"
  description   = "Simple Hello World Lambda function"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  filename      = data.archive_file.lambda_zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)
}
