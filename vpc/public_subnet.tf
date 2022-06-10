resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.150.50.0/23"
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"

  tags = {
    Name = "${var.vpc_name}-public-sn"
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

resource "aws_route_table_association" "rt_ass_public_sn" {
  route_table_id = aws_route_table.main_public_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}
