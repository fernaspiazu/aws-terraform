terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.2"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = var.organization

    workspaces {
      name = "aws-eks"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = var.organization
    workspaces = {
      name = "aws-vpc"
    }
  }
}

data "aws_vpc" "main_vpc" {
  id = data.terraform_remote_state.vpc.outputs.vpc_id
}