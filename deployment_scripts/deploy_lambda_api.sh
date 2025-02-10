#!/bin/bash
export AWS_PROFILE=admin-role

# Navigate to the Terraform directory
cd /workspaces/practice_aws_de_dash/terraform || exit

# Initialize Terraform
terraform init

# Apply only the Lambda and API Gateway modules
terraform apply -target=module.cost_explorer_lambda -target=module.api_gateway -auto-approve