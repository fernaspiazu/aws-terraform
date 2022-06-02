resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.161.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name,
    Description = "Main VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.161.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-pub-sn"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "main_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    "Name" = "${var.vpc_name}-pub-rt"
  }
}

resource "aws_route_table_association" "main_rt_ass_pub_subnet" {
  route_table_id = aws_route_table.main_public_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}