#!/bin/bash
export AWS_PROFILE=admin-role

# Navigate to the Terraform directory
cd /workspaces/practice_aws_de_dash/terraform || exit

# Initialize Terraform
terraform init

# Apply Terraform
terraform apply -target=module.react_site -auto-approve

# Get the CloudFront Distribution ID
DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id)

# Create CloudFront Invalidation
aws cloudfront create-invalidation \
    --distribution-id "$DISTRIBUTION_ID" \
    --paths "/*"