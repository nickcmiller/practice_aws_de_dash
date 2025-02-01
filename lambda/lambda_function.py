import boto3
import datetime

def lambda_handler(event, context):
    # Calculate start and end dates for the previous month
    today = datetime.date.today()
    first_of_this_month = today.replace(day=1)
    last_month_end = first_of_this_month - datetime.timedelta(days=1)
    last_month_start = last_month_end.replace(day=1)
    
    ce = boto3.client('ce')
    
    try:
        response = ce.get_cost_and_usage(
            TimePeriod={
                'Start': last_month_start.strftime('%Y-%m-%d'),
                'End': (last_month_end + datetime.timedelta(days=1)).strftime('%Y-%m-%d')
            },
            Granularity='MONTHLY',
            Metrics=['UnblendedCost']
        )
        cost_data = response['ResultsByTime'][0]['Total']['UnblendedCost']['Amount']
        message = f"Cost for {last_month_start.strftime('%B %Y')}: ${cost_data}"
    except Exception as e:
        message = f"Error retrieving cost data: {str(e)}"
    
    return {
        "statusCode": 200,
        "body": message
    }