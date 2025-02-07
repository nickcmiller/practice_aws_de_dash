# output "website_endpoint" {
#   description = "The endpoint of the static website"
#   value       = module.react_site.website_endpoint
# }

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.react_site.cloudfront_domain_name
}