# AWS Infrastructure Automation using Terraform

This project demonstrates how to provision a complete AWS infrastructure using Terraform following Infrastructure as Code (IaC) best practices.

## Features

- Modular Terraform Architecture
- AWS VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables & Associations
- Security Groups
- EC2 Launch Template
- Auto Scaling Group
- Application Load Balancer (ALB)
- Target Group
- Listener
- Variables & terraform.tfvars
- Outputs
- Remote S3 Backend
- AWS CLI Integration

## Technologies

- Terraform
- AWS
- EC2
- VPC
- Auto Scaling
- Application Load Balancer
- S3 Backend
- Git & GitHub

## Project Structure

```text
terraform-project/
│
├── modules/
│   └── networking/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
├── security-group-ec2.tf
├── security-group-lb.tf
├── application-load-balancer.tf
├── target-group.tf
├── listener.tf
├── launch-template.tf
├── autoscaling.tf
└── backend.tf


###Deployment

terraform init
terraform validate
terraform plan
terraform apply
##
---

## Repository Topics


```text
terraform
aws
infrastructure-as-code
iac
aws-vpc
ec2
autoscaling
load-balancer
terraform-modules
aws-networking
devops
cloud

