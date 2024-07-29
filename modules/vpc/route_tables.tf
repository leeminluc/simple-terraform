resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-public_rt-${var.knox_id}"
    }
  )

}

resource "aws_route_table_association" "public_rt_assoc1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_assoc2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = aws_vpc.myvpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-private_rt-${var.knox_id}"
    }
  )

}

resource "aws_route_table_association" "private_rt_assoc1" {
  subnet_id = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_assoc2" {
  subnet_id = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_vpc_endpoint_route_table_association" "vpc_endpoint_assoc" {
  route_table_id  = aws_route_table.private_rt.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
