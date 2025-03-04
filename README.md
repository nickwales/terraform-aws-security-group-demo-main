## AWS Security Group Demo Module

This Terraform module adds a security group rule that allows traffic from a node. This is a simplistic module created for Consul-Terraform-Sync demoing purposes.

## Feature
This module uses the AWS Terraform provider to create a new security group rule, allowing ingress TCP traffic on all ports from an EC2 instance.

## Requirements

### Ecosystem Requirements
| Ecosystem | Version |
|-----------|---------|
| [consul](https://www.consul.io/downloads) | >= 1.7 |
| [consul-terraform-sync](https://www.consul.io/docs/nia) | >= 0.1.0 |
| [terraform](https://www.terraform.io) | >= 0.13 |

### Terraform Providers

| Name | Version |
|------|---------|
| aws | >= 3.56 |

## Setup

1. Create an AWS security group.

## Usage

| Input Variable | Required | Description |
|-------------------|----------|-------------|
| security_group_id | true | The ID of the security group |

**User Config for Consul Terraform Sync**

example.hcl
```hcl
task {
  name           = "security-group-demo-task"
  description    = "allow all ingress TCP traffic to a security group"
  source         = "mkam/security-group-demo/aws"
  version        = "0.1.0"
  providers      = ["aws"]
  services       = ["web", "app"]
  variable_files = ["security_input.tfvars"]
}

driver "terraform" {
  required_providers = {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

terraform_provider "aws" {
  region = "us-west-1"
}
```

**Variable file**

Optional input variable file defined by a user for the task above.

security_input.tfvars
```hcl
security_group_id = "sg-123"
```
