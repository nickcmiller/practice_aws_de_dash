# output "website_endpoint" {
#   description = "The endpoint of the static website"
#   value       = aws_s3_bucket_website_configuration.website_bucket_config.website_endpoint
# }

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.website_distribution.domain_name
}