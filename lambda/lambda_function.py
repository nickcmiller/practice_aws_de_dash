import datetime
import boto3
import json

def lambda_handler(event, context):
    # Calculate start and end dates for the current month
    today = datetime.date.today()
    first_of_this_month = today.replace(day=1)
    
    time_period = {
        'Start': first_of_this_month.strftime('%Y-%m-%d'),
        'End': today.strftime('%Y-%m-%d')
    }
    
    ce = boto3.client('ce')
    
    try:
        response = ce.get_cost_and_usage(
            TimePeriod=time_period,
            Granularity='MONTHLY',
            Metrics=['UnblendedCost']
        )
        
        if response['ResultsByTime']:
            cost_data = response['ResultsByTime'][0]['Total']['UnblendedCost']
            amount = float(cost_data['Amount'])
            unit = cost_data['Unit']
            message = f"Cost for {first_of_this_month.strftime('%B %Y')} (Month to Date): ${amount:.2f} {unit}"
        else:
            message = "No results found for the specified time period."
            
    except Exception as e:
        message = f"Error retrieving cost data: {str(e)}"
        print(f"Error: {str(e)}")
    
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token',
            'Access-Control-Allow-Methods': 'GET,OPTIONS',
            'Content-Type': 'application/json'
        },
        'body': json.dumps({'message': message})  # Wrap message in an object and convert to JSON string
    }