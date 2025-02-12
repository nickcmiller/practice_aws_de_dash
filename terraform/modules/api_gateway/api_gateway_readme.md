# API Gateway Module

## Overview

This Terraform module creates an AWS API Gateway for a Cost Explorer Lambda function. It sets up a RESTful API endpoint that allows retrieving cost information through a serverless architecture.

## Features

- Creates a REST API Gateway
- Configures a `/cost` resource endpoint
- Supports GET method for cost retrieval
- Implements CORS (Cross-Origin Resource Sharing)
- Integrates with a Lambda function
- Provides a production stage deployment

## Resources Created

- `aws_api_gateway_rest_api`: Main API Gateway
- `aws_api_gateway_resource`: `/cost` endpoint
- `aws_api_gateway_method`: GET and OPTIONS methods
- `aws_api_gateway_integration`: Lambda and mock integrations
- `aws_lambda_permission`: Allows API Gateway to invoke Lambda
- `aws_api_gateway_deployment`: API deployment
- `aws_api_gateway_stage`: Production stage

## Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `lambda_invoke_arn` | ARN of the Lambda function to invoke | `string` | Yes |
| `lambda_function_name` | Name of the Lambda function | `string` | Yes |

## Outputs

| Name | Description |
|------|-------------|
| `invoke_url` | The invoke URL for the API Gateway |

## Usage Example

```hcl
module "cost_api" {
    source = "./modules/api_gateway"
    lambda_invoke_arn = module.cost_lambda.invoke_arn
    lambda_function_name = module.cost_lambda.function_name
}   
```

## CORS Configuration

The module includes a comprehensive CORS configuration:
- Allows GET and OPTIONS methods
- Permits all origins (`*`)
- Supports standard headers like Content-Type and Authorization

## Deployment Notes

- The API is deployed to a "prod" stage
- Uses a trigger based on resource hash to manage redeployments
- Implements a `create_before_destroy` lifecycle for zero-downtime updates

## Security Considerations

- No authorization is currently configured
- Consider adding authentication for production use