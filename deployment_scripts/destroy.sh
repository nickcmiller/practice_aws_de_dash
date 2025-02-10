#!/bin/bash
export AWS_PROFILE=admin-role

# Navigate to the Terraform directory
cd /workspaces/practice_aws_de_dash/terraform || exit

# Destroy Terraform
terraform destroy -auto-approve