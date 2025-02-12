# AWS Cost Explorer Dashboard

## Overview

A serverless AWS cost monitoring solution that provides real-time cost insights through a modern web interface. The project combines a React frontend, AWS Lambda backend, and API Gateway to create a seamless cost exploration experience.

## Architecture

```
┌─────────────────┐     ┌──────────────┐     ┌────────────────┐
│   React App     │     │ API Gateway  │     │ Lambda Function│
│  (CloudFront)   │────▶│   (REST)     │────▶│(Cost Explorer) │
└─────────────────┘     └──────────────┘     └────────────────┘
```

## Project Structure

```
.
├── deployment_scripts/    # Deployment automation scripts
│   ├── all_deploy.sh     # Complete deployment script
│   ├── destroy.sh        # Resource cleanup script
│   ├── lambda_api_apply.sh   # Lambda and API deployment
│   └── s3_apply.sh      # React site deployment
│
├── lambda/              # AWS Lambda function code
│   └── lambda_function.py   # Cost Explorer implementation
│
├── react/              # Frontend React application
│   ├── src/            # React source code
│   ├── public/         # Static assets
│   └── build/          # Production build output
│
└── terraform/          # Infrastructure as Code
    ├── main.tf         # Main Terraform configuration
    ├── outputs.tf      # Output definitions
    └── modules/        # Terraform modules
        ├── api_gateway/    # API Gateway configuration
        ├── lambda/        # Lambda function infrastructure
        └── react_site/    # Static site hosting setup
```

## Prerequisites

- Node.js 14.x or later
- AWS CLI configured with appropriate credentials
- Terraform 1.0+
- Python 3.8+
- AWS Account with permissions for:
  - Lambda
  - API Gateway
  - S3
  - CloudFront
  - IAM
  - Cost Explorer

## Quick Start

1. **Clone the repository**
```bash
git clone [repository-url]
cd [repository-name]
```

2. **Install React dependencies**
```bash
cd react
npm install
```

3. **Deploy the infrastructure**
```bash
cd ../deployment_scripts
chmod +x *.sh
./all_deploy.sh
```

The deployment script will:
- Deploy Lambda function and API Gateway
- Build and deploy the React application
- Configure CloudFront distribution
- Set up necessary environment variables

## Component Details

### React Frontend
- Modern, responsive web interface
- Real-time cost data display
- Environment-based configuration
- Built with React and CSS modules

### Lambda Backend
- Python-based AWS Lambda function
- Retrieves current month's cost data
- Implements error handling and logging
- CORS-enabled for web access

### Infrastructure
- Serverless architecture
- CloudFront for content delivery
- S3 for static hosting
- API Gateway for REST endpoints

## Development

### Local Development
1. Start React development server:
```bash
cd react
npm start
```

2. Set up local environment:
```bash
cp .env.example .env
# Edit .env with your API Gateway URL
```

### Deployment

#### Full Deployment
```bash
./deployment_scripts/all_deploy.sh
```

#### Component Deployment
- Lambda and API only:
```bash
./deployment_scripts/lambda_api_apply.sh
```

- React site only:
```bash
./deployment_scripts/s3_apply.sh
```

### Cleanup
```bash
./deployment_scripts/destroy.sh
```

## Security

- Least privilege IAM roles
- CloudFront HTTPS
- S3 bucket encryption
- API Gateway resource policies
- No public S3 access

## Troubleshooting

1. **API Gateway Issues**
   - Check CloudWatch logs
   - Verify CORS configuration
   - Ensure Lambda permissions

2. **React Build Issues**
   - Verify Node.js version
   - Check environment variables
   - Clear npm cache if needed

3. **Deployment Issues**
   - Verify AWS credentials
   - Check Terraform state
   - Review CloudWatch logs

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

[Specify your license here]

## Acknowledgments

- AWS Documentation
- Terraform Documentation
- React Documentation