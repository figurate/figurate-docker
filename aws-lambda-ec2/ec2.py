import boto3
import botocore.exceptions
import os


def lambda_handler(event, context):
    ec2_instance = get_instance_name(event)
    if event['Action'] == 'StartInstance':
        start_instance(ec2_instance)
    elif event['Action'] == 'StopInstance':
        stop_instance(ec2_instance)


def get_instance_name(event):
    if event['EC2InstanceId']:
        return event['EC2InstanceId']
    else:
        return os.environ.get('EC2InstanceId')


def start_instance(ec2_instance):
    ec2 = boto3.client('ec2')
    try:
        response = ec2.start_instances(InstanceIds=[ec2_instance])
        return {
            'message': f"Instance started: {str(response)}"
        }
    except botocore.exceptions.ClientError as e:
        print(e)


def stop_instance(ec2_instance):
    ec2 = boto3.client('ec2')
    try:
        response = ec2.stop_instances(InstanceIds=[ec2_instance])
        return {
            'message': f"Instance stopped: {str(response)}"
        }
    except botocore.exceptions.ClientError as e:
        print(e)
