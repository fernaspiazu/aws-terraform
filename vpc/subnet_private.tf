resource "aws_subnet" "private_subnet" {
  for_each                = var.private_subnet_cidr
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-sn-${each.key}"
  }
}

resource "aws_route_table" "main_private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.vpc_name}-private-rt"
  }
}

resource "aws_route_table_association" "rt_ass_private_sn" {
  for_each       = var.private_subnet_cidr
  subnet_id      = aws_subnet.private_subnet["${each.key}"].id
  route_table_id = aws_route_table.main_private_rt.id
}