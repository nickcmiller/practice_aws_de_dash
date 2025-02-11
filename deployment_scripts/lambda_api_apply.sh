#!/bin/bash
export AWS_PROFILE=admin-role

# Navigate to the Terraform directory
cd /workspaces/practice_aws_de_dash/terraform || exit

# Initialize Terraform
terraform init

# Apply only the Lambda and API Gateway modules
terraform apply -target=module.cost_explorer_lambda -target=module.api_gateway -auto-approve

# Fetch the API Gateway URL from Terraform outputs
API_GATEWAY_URL=$(terraform output -raw api_gateway_url)
if [ -z "$API_GATEWAY_URL" ]; then
  echo "Error: API Gateway URL not found in Terraform outputs."
  exit 1
fi
echo "API Gateway URL: $API_GATEWAY_URL"

# Generate/update the .env file in the React project with the API URL
echo "REACT_APP_API_GATEWAY_URL=${API_GATEWAY_URL}" > ../react/.env
echo ".env file updated in the React project with the API URL"