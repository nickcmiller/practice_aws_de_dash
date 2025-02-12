# Cost Explorer React Application

## Overview

This is a React-based web application designed to fetch and display cost data from an AWS API Gateway endpoint. The application demonstrates a simple, responsive web interface for retrieving and presenting cost information.

## Features

- Fetches data from a configurable API Gateway endpoint
- Responsive design with modern CSS modules
- Error handling and loading states
- Environment-based configuration

## Prerequisites

- Node.js (v14 or later)
- npm or Yarn
- AWS API Gateway endpoint (for cost data)

## Environment Setup

### Required Environment Variables

Create a `.env` file in the project root with the following variable:

```
REACT_APP_API_GATEWAY_URL=https://your-api-gateway-url.com/prod
```

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

## Project Structure

```
react/
├── .env                 # Environment variables
├── build/               # Production build output
├── node_modules/        # Node.js dependencies
├── public/
│   └── index.html         # HTML entry point
├── src/
│   ├── App.js             # Main application component
│   ├── App.module.css     # Component-specific styles
│   └── index.js           # React rendering entry point
└── react_readme.md              # This file
```

## Deployment

### AWS S3 and CloudFront

This application is designed to be deployed using the accompanying Terraform module, which provisions:
- S3 bucket for static file hosting
- CloudFront distribution for content delivery
- Secure access configurations

## Error Handling

The application includes comprehensive error handling:
- Checks for undefined API URL
- Displays loading states
- Shows detailed error messages
- Logs debugging information to console

## Customization

You can easily customize:
- Styling in `App.module.css`
- API endpoint in environment variables
- Component logic in `App.js`

## Security Considerations

- Uses environment variables for configuration
- Implements CORS-friendly fetch configuration
- Provides clear error messaging without exposing sensitive details

## Troubleshooting

- Ensure `REACT_APP_API_GATEWAY_URL` is correctly set
- Check browser console for detailed error messages
- Verify API Gateway endpoint is accessible