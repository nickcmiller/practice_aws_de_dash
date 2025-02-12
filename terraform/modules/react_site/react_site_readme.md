# React Static Site Terraform Module

## Overview

This Terraform module provisions a secure, scalable, and performant static website hosting solution using AWS S3 and CloudFront. It's designed to easily deploy React (or other static) web applications with best practices for security and content delivery.

## Features

- S3 bucket for website file storage
- Enabled bucket versioning
- Server-side encryption
- CloudFront distribution for global content delivery
- HTTPS redirect
- Secure bucket access via Origin Access Identity (OAI)

## Prerequisites

- Terraform 1.0+
- AWS Provider
- Built React application files

## Usage
```hcl
module "react_site" {
    source = "./modules/react_site"
    bucket_name = "my-react-website-bucket"
    website_source_dir = "${path.module}/build"
}

output "website_url" {
    value = module.react_site.cloudfront_domain_name
}
```


## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `bucket_name` | S3 bucket name for hosting the static website | `string` | - |
| `website_source_dir` | Local directory path containing built website files | `string` | - |

## Outputs

| Name | Description |
|------|-------------|
| `cloudfront_domain_name` | CloudFront distribution domain name |
| `cloudfront_distribution_id` | CloudFront distribution ID |

## Security Configuration

- Bucket versioning enabled
- Server-side encryption (AES256)
- Bucket ownership set to "BucketOwnerPreferred"
- Public access blocks enabled
- CloudFront Origin Access Identity for secure S3 access

## Deployment Notes

1. Ensure your React app is built before running Terraform
2. The `website_source_dir` should point to your build output directory
3. CloudFront uses the default SSL certificate in this configuration

## Customization

You can extend this module to add:
- Custom domain names
- WAF rules
- Additional cache behaviors
- Custom SSL certificates