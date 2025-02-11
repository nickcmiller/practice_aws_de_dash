# output "website_endpoint" {
#   description = "The endpoint of the static website"
#   value       = module.react_site.website_endpoint
# }

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.react_site.cloudfront_domain_name
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.react_site.cloudfront_distribution_id
}

output "api_gateway_url" {
  description = "URL of the API Gateway endpoint"
  value       = module.api_gateway.invoke_url
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.cost_explorer_lambda.lambda_function_arn
}

output "lambda_function_invoke_arn" {
  description = "ARN of the Lambda function to invoke"
  value       = module.cost_explorer_lambda.lambda_invoke_arn
}