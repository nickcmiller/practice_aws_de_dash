# AWS Monthly Cost Retrieval Lambda Function

## Overview
This AWS Lambda function retrieves the unblended cost for the current month using the AWS Cost Explorer API.

## Features
- Calculates cost for the current month to date
- Returns cost information as a JSON response
- Handles potential errors gracefully
- Supports CORS for web application integration

## Prerequisites
- AWS Lambda environment
- Boto3 library
- IAM role with Cost Explorer read permissions

## Function Details
- **Runtime**: Python 3.x
- **Trigger**: Can be invoked via API Gateway or other AWS services
- **Cost Retrieval Method**: 
  - Uses AWS Cost Explorer API
  - Retrieves unblended cost for current month
  - Granularity set to MONTHLY

## IAM Permissions Required
Ensure the Lambda execution role has the following permissions:
- `ce:GetCostAndUsage`

## Response Format
```json
{
    "statusCode": 200,
    "body": {
    "message": "Cost for September 2023 (Month to Date): $123.45 USD"
    }
}
```

## Error Handling
- Returns error message if cost retrieval fails
- Prints detailed error to CloudWatch logs

## Deployment Notes
1. Set up appropriate IAM roles
2. Configure Lambda function with Python runtime
3. Set environment variables if needed
4. Configure API Gateway for HTTP access (optional)

## Example Use Cases
- Monthly cost tracking
- Budget monitoring
- Integration with dashboard or reporting tools

## Security Considerations
- CORS headers enabled for flexible web integration
- Minimal IAM permissions recommended