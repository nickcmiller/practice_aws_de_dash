output "invoke_url" {
  description = "The invoke URL for the API Gateway"
  value       = "${aws_api_gateway_deployment.api_deployment.invoke_url}/cost"
}