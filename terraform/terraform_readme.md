# AWS Cost Explorer Infrastructure

## Overview

This Terraform project provisions a serverless cost monitoring solution using AWS services, including:
- AWS Lambda function for cost retrieval
- API Gateway for exposing the Lambda function
- S3 and CloudFront for hosting a React static website

## Architecture

```
                   +-------------------+
                   |   React Website   |
                   |   (CloudFront)    |
                   +--------+----------+
                            |
                            v
                   +-------------------+
                   |   API Gateway     |
                   +--------+----------+
                            |
                            v
                   +-------------------+
                   |   Lambda Function |
                   | (Cost Explorer)   |
                   +-------------------+
```

## Prerequisites

- Terraform 1.0+
- AWS CLI configured with appropriate credentials
- AWS Account with permissions to create:
  - Lambda functions
  - API Gateway
  - S3 buckets
  - CloudFront distributions
  - IAM roles and policies

## Project Structure

```
terraform/
├── main.tf                 # Primary Terraform configuration
├── outputs.tf              # Project-level outputs│
└── modules/
    ├── api_gateway/        # API Gateway module
    ├── lambda/             # Lambda function module
    └── react_site/         # React static site hosting module
```

## Modules

### 1. Lambda Module
- Creates a Lambda function to retrieve AWS cost data
- Configures IAM roles and permissions
- Supports Cost Explorer API access

### 2. API Gateway Module
- Sets up a REST API endpoint
- Integrates with the Lambda function
- Implements CORS for web access

### 3. React Site Module
- Provisions S3 bucket for website hosting
- Configures CloudFront distribution
- Implements secure static site deployment

## Environment Setup

1. Configure AWS CLI
```bash
aws configure
```

2. Initialize Terraform
```bash
terraform init
```

3. Plan the infrastructure
```bash
terraform plan
```

4. Apply the configuration
```bash
terraform apply
```

## Configuration

### Environment Variables

Create a `.env` file in the React project with:
```
REACT_APP_API_GATEWAY_URL=<API_GATEWAY_INVOKE_URL>/prod/cost
```

### Customization

Modify `main.tf` to:
- Change AWS region
- Adjust resource names
- Add tags or additional configurations

## Deployment Workflow

1. Build React application
```bash
cd ../react
npm run build
```

2. Run Terraform
```bash
cd ../terraform
terraform apply
```

## Security Considerations

- Uses least-privilege IAM roles
- Implements server-side encryption
- CloudFront with HTTPS
- Restricted S3 bucket access

## Outputs

After applying Terraform, you'll receive:
- CloudFront domain name
- API Gateway URL
- Lambda function ARNs

## Cleanup

To remove all resources:
```bash
terraform destroy
```

## Troubleshooting

- Ensure AWS CLI is configured
- Check IAM permissions
- Verify network connectivity
- Review CloudWatch logs for Lambda

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request