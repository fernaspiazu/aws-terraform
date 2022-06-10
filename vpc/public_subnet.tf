resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.161.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-public-sn-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.161.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-public-sn-b"
  }
}

resource "aws_subnet" "public_subnet_c" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.161.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-public-sn-c"
  }
}

resource "aws_route_table" "main_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    "Name" = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "rt_ass_public_sn_a" {
  route_table_id = aws_route_table.main_public_rt.id
  subnet_id      = aws_subnet.public_subnet_a.id
}

resource "aws_route_table_association" "rt_ass_public_sn_b" {
  route_table_id = aws_route_table.main_public_rt.id
  subnet_id      = aws_subnet.public_subnet_b.id
}

resource "aws_route_table_association" "rt_ass_public_sn_c" {
  route_table_id = aws_route_table.main_public_rt.id
  subnet_id      = aws_subnet.public_subnet_c.id
}