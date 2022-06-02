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

variable "ami_amzn_linux_2" {
  type        = string
  description = "Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type (64-bit x86)"
  default     = "ami-09439f09c55136ecf"
}