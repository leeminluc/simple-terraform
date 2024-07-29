output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "s3_endpoint" {
  value = aws_vpc_endpoint.s3.prefix_list_id
}

output "private_sub_1" {
  value = aws_subnet.private1.id
}

output "private_sub_2" {
  value = aws_subnet.private2.id
}

output "public_sub_1" {
  value = aws_subnet.public1.id
}

output "public_sub_2" {
  value = aws_subnet.public2.id
}
