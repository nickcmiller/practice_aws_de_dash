variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "cost-explorer"
}

variable "lambda_role_name" {
  description = "Name of the Lambda IAM role"
  type        = string
  default     = "cost_explorer_lambda_role"
}

variable "lambda_source_dir" {
  description = "Directory containing Lambda function code"
  type        = string
  default     = "../lambda"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}