resource "aws_instance" "mybastion" {
  ami                          = var.ami_id
  instance_type                = var.instance_type
  key_name                     = var.key_pair
  vpc_security_group_ids       = [aws_security_group.bastion_sg.id]
  source_dest_check            = false
  subnet_id                    = var.public_sub_1
  associate_public_ip_address  = true

  user_data = file(var.user_data_bastion)

    tags = merge(
    "${var.gbl-tags}","${var.addtl-tags}",
    { 
      Name = "${var.environment_name}-bastion-${var.knox_id}"
    }
  )

}
