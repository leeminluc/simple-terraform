resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_1
  availability_zone = "us-east-2a"

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-public_subnet-${var.knox_id}-001"
    }
  )

}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet_2
  availability_zone = "us-east-2b"

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-public_subnet-${var.knox_id}-002"
    }
  )

}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_1
  availability_zone = "us-east-2a"

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-private_subnet-${var.knox_id}-001"
    }
  )

}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_2
  availability_zone = "us-east-2b"

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-private_subnet-${var.knox_id}-002"
    }
  )

}
