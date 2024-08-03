Below is an example of how you can create an AWS Lambda function to calculate and show the 98th percentile of ingress traffic using AWS CloudWatch metrics. This example assumes you have metrics being sent to CloudWatch for your ingress traffic.

1. IAM Role and Permissions

First, ensure that your Lambda function has the necessary permissions to read from CloudWatch. You can create an IAM role with the following policy:

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:GetMetricStatistics",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}


2. Lambda Function Code

Here’s an example of a Python Lambda function that calculates the 98th percentile for ingress traffic:

import boto3
import datetime
import json

def lambda_handler(event, context):
    cloudwatch = boto3.client('cloudwatch')
    
    # Define the time range for the metrics
    end_time = datetime.datetime.utcnow()
    start_time = end_time - datetime.timedelta(hours=1)
    
    # Define the metric and namespace
    namespace = 'YourNamespace'
    metric_name = 'IngressTraffic'
    statistic = 'p98'
    
    # Get the metric statistics
    response = cloudwatch.get_metric_statistics(
        Namespace=namespace,
        MetricName=metric_name,
        StartTime=start_time,
        EndTime=end_time,
        Period=300,
        Statistics=[statistic]
    )
    
    # Extract the data points
    datapoints = response['Datapoints']
    
    # Sort data points by timestamp
    datapoints.sort(key=lambda x: x['Timestamp'])
    
    if datapoints:
        # Get the latest value for the 98th percentile
        percentile_value = datapoints[-1][statistic]
    else:
        percentile_value = None
    
    return {
        'statusCode': 200,
        'body': json.dumps({
            '98thPercentileIngressTraffic': percentile_value
        })
    }

# To test locally
if __name__ == "__main__":
    print(lambda_handler({}, {}))


3. Deploy the Lambda Function

	1.	Create a Lambda Function:
	•	Go to the AWS Lambda console.
	•	Click “Create function”.
	•	Choose “Author from scratch”.
	•	Set the function name, runtime (Python 3.x), and role.
	2.	Add the Code:
	•	Copy the above code into the function code editor.
	3.	Configure the Function:
	•	Set the handler to lambda_function.lambda_handler.
	4.	Deploy:
	•	Save and deploy the function.

4. Testing the Function

You can test the function directly from the Lambda console or by invoking it using the AWS CLI:

"aws lambda invoke --function-name YourLambdaFunctionName output.json
cat output.json"


Replace YourNamespace and IngressTraffic with the appropriate namespace and metric name that you are using to collect ingress traffic data. The function calculates the 98th percentile for the last hour of ingress traffic data.
