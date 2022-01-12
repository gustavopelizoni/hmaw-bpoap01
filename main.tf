#terraform 
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

## Configure the AWS Provider
provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "Almee"

    workspaces {
      name = "aws-terraform-ecs-hmaw-bpoap01"
    }
  }
}