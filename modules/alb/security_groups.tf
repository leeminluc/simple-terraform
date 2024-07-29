resource "aws_security_group" "alb_sg" {
  name        = "skillup-alb_sg-jon.julian"
  description = "Application Load Balancer security group"
  vpc_id      = var.myvpc_id

  ingress {
    description      = "HTTP access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.myip]
  }

  tags = merge(
    "${var.gbl-tags}",
    { 
      Name = "${var.environment_name}-alb_sg-${var.knox_id}"
    }
  )

}

resource "aws_security_group" "bastion_sg" {
  name        = "skillup-bastion_sg-jon.julian"
  description = "Bastion security group"
  vpc_id      = var.myvpc_id

  ingress {
    description      = "Allow access from skillup-bastion"
    from_port        = 6522
    to_port          = 6522
    protocol         = "tcp"
    cidr_blocks      = [var.skillup_bastion_host]
  }

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-bastion_sg-${var.knox_id}"
    }
  )

}

resource "aws_security_group_rule" "to_webserver" {
  description              = "Access from bastion to webserver"
  type                     = "egress"
  from_port                = 6522
  to_port                  = 6522
  protocol                 = "tcp"
  source_security_group_id = var.private_sg_id
  security_group_id        = aws_security_group.bastion_sg.id
}

resource "aws_security_group_rule" "alb_to_webserver" {
  description              = "Access to webserver via http"
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = var.private_sg_id
  security_group_id        = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "bastion_to_bastion" {
  description              = "Bastion jon.julian"
  type                     = "egress"
  from_port                = 6522
  to_port                  = 6522
  protocol                 = "tcp"
  cidr_blocks              = ["${aws_instance.mybastion.public_ip}/32"]
  security_group_id        = var.skillup_sg_id
}
