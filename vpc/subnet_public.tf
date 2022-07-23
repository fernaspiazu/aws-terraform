resource "aws_subnet" "public_subnet" {
  for_each                = var.public_subnet_cidr
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = true

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
  for_each       = var.public_subnet_cidr
  subnet_id      = aws_subnet.public_subnet["${each.key}"].id
  route_table_id = aws_route_table.main_public_rt.id
}
