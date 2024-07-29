resource "aws_launch_template" "lt" {
  name   = "${var.environment_name}-lt-${var.knox_id}"
  image_id      = "ami-00cae939ca4303fd5"
  instance_type = "t2.micro"
  key_name = "skillup-kp-jon.julian-001"
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  iam_instance_profile {
    name = "skillup-instanceprofile"
  }

  tags = merge(
    "${var.gbl-tags}", "${var.addtl-tags}",
    {
      Name = "${var.environment_name}-ec2-${var.knox_id}"
    }
  )

  user_data = filebase64("modules/asg/user_data/user_data_webserver.sh")

  tag_specifications {
    resource_type = "instance"

    tags = merge(
    "${var.gbl-tags}", "${var.addtl-tags}",
    {
      Name = "${var.environment_name}-ec2-${var.knox_id}"
    }
  )
  }
}

resource "aws_autoscaling_group" "asg" {
  name = "skillup-asg-jon.julian"
  desired_capacity          = 2
  max_size                  = 2
  min_size                  = 1
  vpc_zone_identifier       = [var.private_sub_1,var.private_sub_2]
  wait_for_capacity_timeout = 0
  health_check_type         = "ELB"
  target_group_arns         = [var.tg_arn]

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}
