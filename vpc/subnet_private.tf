resource "aws_subnet" "private" {
  for_each                = var.private_subnet_cidr
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = "${var.region}${each.key}"
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.vpc_name}-private-sn-${each.key}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${var.vpc_name}-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  for_each       = var.private_subnet_cidr
  subnet_id      = aws_subnet.private["${each.key}"].id
  route_table_id = aws_route_table.private.id
}