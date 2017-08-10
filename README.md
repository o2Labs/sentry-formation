# What is it

An attempt to follow best practices to create a production-ready installation of Sentry.io on AWS.

Features:
- HTTPS end-to-end
- Load-balanced, Multi-AZ setup
- Creates own VPC
- Encryption using integrated KMS key
- Limit sentry access to your GitHub organisation

## Getting Started

Just click [![Launch Stack](launch-stack.png)](https://console.aws.amazon.com/cloudformation/home#/stacks/new?stackName=sentry&templateURL=https:%2F%2Fs3-eu-west-1.amazonaws.com%2Fsentry-formation%2Fcloud-formation.yaml)

Or click ["Create Stack" in the CloudFormation AWS console](https://console.aws.amazon.com/cloudformation/home?#/stacks/new) and specify the Amazon S3 template URL:

```
https://s3-eu-west-1.amazonaws.com/sentry-formation/cloud-formation.yaml
```

### Automating Deployments

This is a great option if you want to automatically deploy your stack from your CI server:

1. Take a copy of `deploy-example.sh`.
2. Fill in the parameters.

### Running locally

```
vagrant up
ansible-playbook site.yml -u vagrant
```

Your site should then be available at https://33.33.33.20/

## Credits

Original version developed by Karl Turner (@otaiga), Bradley Allen (@ValkyrieUK) and Daniel Bradley (@danielrbradley).

[Using AWS KMS to Encrypt Values in CloudFormation Stacks](https://ben.fogbutter.com/2016/02/22/using-kms-to-encrypt-cloud-formation-values.html) by Ben Jones (@RealSalmon)

Starting point for CloudFormation setup: https://github.com/acervos/sentry
