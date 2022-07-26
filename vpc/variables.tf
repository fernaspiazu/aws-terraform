variable "region" {
  type        = string
  description = "AWS Region"
}

variable "access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "secret_key" {
  type        = string
  description = "AWS Secret Key"
}

variable "organization" {
  type = string
  description = "My TFC organization"
}

variable "vpc_name" {
  default = "main-vpc"
}

variable "vpc_cidr" {
  default = "10.150.0.0/16"
}

variable "public_subnet_cidr" {
  type = map(string)
  default = {
    "a" = "10.150.50.0/23"
  }
}

variable "private_subnet_cidr" {
  type = map(string)
  default = {
    "a" = "10.150.60.0/24",
    "b" = "10.150.61.0/24",
    "c" = "10.150.62.0/24"
  }
}