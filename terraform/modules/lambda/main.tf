# ------------------------------
# Add a Lambda execution IAM role
# ------------------------------
resource "aws_iam_role" "lambda_exec" {
  name = var.lambda_role_name
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

resource "aws_iam_policy" "lambda_cost_usage_policy" {
  name        = "lambda_cost_usage_policy"
  description = "Policy for Lambda to access AWS Cost Explorer"
  policy      = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Action: [
          "ce:GetCostAndUsage"
        ],
        Resource: "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_cost_usage_policy_attachment" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_cost_usage_policy.arn
}

# ------------------------------
# Create a zip archive of the lambda function code
# ------------------------------
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = "lambda_function_payload.zip"
}

# ------------------------------
# Create the Lambda Function resource
# ------------------------------
resource "aws_lambda_function" "cost_explorer" {
  function_name    = var.function_name
  description      = "Lambda function to fetch AWS cost data"
  runtime          = "python3.8"
  role            = aws_iam_role.lambda_exec.arn
  handler         = "lambda_function.lambda_handler"
  filename        = data.archive_file.lambda_zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  tags = var.tags
}