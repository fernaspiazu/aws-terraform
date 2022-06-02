provider "aws" {
  region = var.region

  assume_role {
    # The role ARN to AssumeRole
    role_arn = var.arn_role
  }
}