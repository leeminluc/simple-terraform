resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
    
  tags = merge(
    "${var.gbl-tags}",
    { 
      Name = "${var.environment_name}-vpc-${var.knox_id}"
    }
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-igw-${var.knox_id}"
    }
  )

}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.myvpc.id
  service_name = "com.amazonaws.us-east-2.s3"

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "skillup-s3endpoint-jon.julian"
    }
  )

}
