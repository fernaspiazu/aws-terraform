variable "region" {
  type = string
  description = "AWS Region"
}

variable "access_key" {
  type = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type = string
  description = "AWS Secret Key"
}

variable "vpc_name" {
  default = "main-vpc"
}