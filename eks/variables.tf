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
  type        = string
  description = "My TFC organization"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
  default     = "dummy-eks"
}