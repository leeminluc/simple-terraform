resource "aws_security_group" "private_sg" {
  name        = "skillup-private_sg-jon.julian"
  description = "Private security group"
  vpc_id      = var.myvpc_id

  ingress {
    description      = "Allow access from bastion"
    from_port        = 6522
    to_port          = 6522
    protocol         = "tcp"
    security_groups  = [var.bastion_sg_id]
  }

  ingress {
    description      = "Allow access from alb"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [var.alb_sg_id]
  }

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-private_sg-${var.knox_id}"
    }
  )

}

resource "aws_security_group_rule" "to_s3" {
  description       = "Access to s3"
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  prefix_list_ids   = [var.s3_endpoint]
  security_group_id = aws_security_group.private_sg.id
}
