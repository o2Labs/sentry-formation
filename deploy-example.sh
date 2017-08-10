#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE_PATH="file://$DIR/cloud-formation.yaml"
STACK_NAME="sentry-test"
OWNER='ParameterKey=Owner,ParameterValue="Example Company Name"'
SENTRY_USER='ParameterKey=SentryAdminUser,ParameterValue="sentry@example.com"'
SENTRY_PASSWORD='ParameterKey=SentryAdminPassword,ParameterValue="CHANGE_ME"'
DNS_NAME='ParameterKey=SentryPublicDnsName,ParameterValue="sentry.example.com"'
SSL_CERT_ARN='ParameterKey=SSLCertARN,ParameterValue="arn:aws:acm:eu-west-1:123456789:certificate/00000000-0000-0000-0000-000000000000"'
SSH_KEY_NAME='ParameterKey=KeyName,ParameterValue=ec2-ssh-key'
DB_USERNAME='ParameterKey=DBMasterUsername,ParameterValue="sentrydbadmin"'
DB_PASSWORD='ParameterKey=DBMasterUserPassword,ParameterValue="CHANGE_ME"'
SENTRY_SECRET_KEY='ParameterKey=SentrySecretKey,ParameterValue="CHANGE_ME"'
GITHUB_APP_ID='ParameterKey=SentryGithubAppId,ParameterValue="YOUR_GITHUB_APP_ID"'
GITHUB_API_SECRET='ParameterKey=SentryGithubApiSecret,ParameterValue="CHANGE_ME"'
MAIL_USERNAME='ParameterKey=SentryMailUsername,ParameterValue="sentrysmtpuser"'
MAIL_PASSWORD='ParameterKey=SentryMailPassword,ParameterValue="CHANGE_ME"'
MAIL_FROM='ParameterKey=SentryMailFrom,ParameterValue="sentry@example.com"'

aws cloudformation describe-stacks --stack-name "$STACK_NAME"&>/dev/null
if [ $? -eq 0 ]
then
  echo "Updating existing stack"
  aws cloudformation update-stack --stack-name "$STACK_NAME" --template-body "$TEMPLATE_PATH" --parameters "$OWNER" "$SENTRY_USER" "$SENTRY_PASSWORD" "$DNS_NAME" "$SSL_CERT_ARN" "$SSH_KEY_NAME" "$DB_USERNAME" "$DB_PASSWORD" "$SENTRY_SECRET_KEY" "$GITHUB_APP_ID" "$GITHUB_API_SECRET" "$MAIL_USERNAME" "$MAIL_PASSWORD" "$MAIL_FROM" --capabilities CAPABILITY_IAM
else
  echo "Creating new stack"
  aws cloudformation create-stack --stack-name "$STACK_NAME" --template-body "$TEMPLATE_PATH" --parameters "$OWNER" "$SENTRY_USER" "$SENTRY_PASSWORD" "$DNS_NAME" "$SSL_CERT_ARN" "$SSH_KEY_NAME" "$DB_USERNAME" "$DB_PASSWORD" "$SENTRY_SECRET_KEY" "$GITHUB_APP_ID" "$GITHUB_API_SECRET" "$MAIL_USERNAME" "$MAIL_PASSWORD" "$MAIL_FROM" --capabilities CAPABILITY_IAM
fi
