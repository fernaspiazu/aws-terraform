resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name,
    Description = "Main VPC"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "cidr_10_161" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = "10.161.0.0/16"
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.vpc_name}-igw"
  }
}
