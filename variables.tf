variable "region" {
  default = ""
}

variable "arn_role" {
  default = "arn:aws:iam::392574648905:role/TerraformCloudAssumedRole"
}

variable "vpc_name" {
  default = "main-vpc"
}