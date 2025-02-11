output "invoke_url" {
  description = "The invoke URL for the API Gateway"
  value       = "${aws_api_gateway_stage.prod.invoke_url}"
}
