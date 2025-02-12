#!/bin/bash

# Run Lambda and API Gateway deployment
bash /workspaces/practice_aws_de_dash/deployment_scripts/lambda_api_apply.sh

# Run S3 and CloudFront deployment for React site
bash /workspaces/practice_aws_de_dash/deployment_scripts/s3_apply.sh