# Serverless Website Demo

the contents of this repo deploys a simple greeting website to AWS cloudfront and S3 using AWS CloudFormation.

## What you will need

1. an AWS Account
2. an IAM user with permissions to the AWS account to depoy the cloudformation template and upload files to S3
3. AWS Tools for Powershell

## Deploying

simply run:

```powershell
.\Deploy.ps1
```

in the root of this repository. The default name of the CLoudFormation stack is `hello-serverless-demo`. To overwrite the name:

```powershell
.\Deploy.ps1 -StackName my-stack
```
