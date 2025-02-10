output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.cost_explorer.arn
}

output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.cost_explorer.function_name
}

output "lambda_invoke_arn" {
  description = "The ARN to be used for invoking the Lambda function"
  value       = aws_lambda_function.cost_explorer.invoke_arn
}

output "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
  value       = aws_iam_role.lambda_exec.arn
}