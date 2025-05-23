# Task 1: Implement Infrastructure using Terraform

## Scenario:
Imagine you're a DevOps engineer at a growing startup. The company has recently developed a new application and wants to leverage AWS for hosting the application. They need to set up and manage the infrastructure. Your task involves:

1. Using Terraform, describe the infrastructure for the application from the previous task https://github.com/benc-uk/nodejs-demoapp
2. Set up and configure an EC2 Auto Scaling group, where the application will be run using Docker configured through EC2 user data. 

The infrastructure should include:
   - Network and security groups for EC2 Auto Scaling group (you can use this module for reference or implementation: terraform-aws-modules/autoscaling/aws)
   - Load balancer and target group

Bonus Task: For those who complete the task quickly, use Terraform to set up email notifications for scaling events using CloudWatch and SNS.

Resutl:
https://github.com/Disablak/week3task1-nodejs-demoapp-terraform/releases/tag/release_task_1
