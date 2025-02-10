# output "website_endpoint" {
#   description = "The endpoint of the static website"
#   value       = module.react_site.website_endpoint
# }

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.react_site.cloudfront_domain_name
}

output "api_gateway_url" {
  description = "URL of the API Gateway endpoint"
  value       = module.api_gateway.invoke_url
}