# Task 1: Implement Infrastructure using Terraform

## Scenario:
Imagine you're a DevOps engineer at a growing startup. The company has recently developed a new application and wants to leverage AWS for hosting the application. They need to set up and manage the infrastructure. Your task involves:

1. Using Terraform, describe the infrastructure for the application from the previous task https://github.com/benc-uk/nodejs-demoapp
2. Set up and configure an EC2 Auto Scaling group, where the application will be run using Docker configured through EC2 user data. 

The infrastructure should include:
   - Network and security groups for EC2 Auto Scaling group (you can use this module for reference or implementation: terraform-aws-modules/autoscaling/aws)
   - Load balancer and target group

Bonus Task: For those who complete the task quickly, use Terraform to set up email notifications for scaling events using CloudWatch and SNS.

## Result:
https://github.com/Disablak/week3task1-nodejs-demoapp-terraform/releases/tag/release_task_1

# Task 2: Infrastructure provisioning with Terragrunt

## Scenario:
You are a DevOps engineer at a budding startup developing a new web service. You're tasked with setting up and maintaining multiple development environments: for testing, staging, and production. You've decided to leverage Terragrunt over plain Terraform to maximize efficiency and reduce code duplication.

## Objectives:
- Getting Started: If you're unfamiliar with Terragrunt, explore its documentation and understand its core concepts.
- Setting Up Base Environments: Describe the two environments from the previous task using Terragrunt. Structure your code to minimize configuration duplication between these environments.
- Module Creation: Write your own Terraform module for provisioning a specific resource, say a virtual machine or a database instance. Incorporate this module within your Terragrunt code.
- Introducing a New Environment: As your startup grows, imagine there's now a dedicated team for performance testing. Add another environment catered for load testing, implementing Terragrunt's best practices.

## Result:
https://github.com/Disablak/week3task1-nodejs-demoapp-terraform/releases/tag/release_task_2

- I tried to maximum share common logic: infrastracture/terragrunt/common/
- Created simple module "my_dynamodb": infrastructure/tarraform/module/my_dynamodb/ and it used in terragrunt/dev
- However I made every part of terraform like a module. I don't know how to keep terraform code available in terraform and terragrunt.

# Task 3: Infrastructure Security

## Scenario:
In this task, you will be implementing security measures to safeguard your infrastructure. Every company is concerned about possible vulnerabilities and wants to make sure that the infrastructure is well protected, so security is important. Your responsibilities involve:

## Objectives:
1. Add DocumentDB service for node-js application
2. Use AWS Security Groups to implement virtual firewalls for your EC2 instances to control inbound and outbound traffic.
3. Implement Identity and Access Management (IAM) policies to manage AWS service permissions and safeguard access to resources, add policy for EC2 node-js to communicate with DocumentDB.
4*. Use AWS Inspector to automate security assessment and find vulnerabilities or deviations from best practices in your applications deployed on AWS.

## Result:
https://github.com/Disablak/week3task1-nodejs-demoapp-terraform/releases/tag/release_task_3

- Added new module with DocumentDB: infrastracture/terraform/common/documentdb
- In DocumentDB's SG added in inbound rule EC2's SG for communication
- To EC2's template added IAM Role to allow communication with DocumentDB
- In Amazon Console enabled AWS Inspector
- Added module for enebling AWS Inspector for EC2: infrastracture/terraform/common/amazon_inspector
