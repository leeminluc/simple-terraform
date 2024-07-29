resource "aws_lb" "alb" {
  name               = "${var.environment_name}-alb-jonjulian"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [var.public_sub_1,var.public_sub_2]

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-alb-jonjulian"
    }
  )

}

resource "aws_lb_target_group" "tg" {
  name        = "${var.environment_name}-tg-jonjulian"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.myvpc_id

  tags = merge(
    "${var.gbl-tags}",
    {
      Name = "${var.environment_name}-tg-jonjulian"
    }
  )

}

resource "aws_lb_listener" "alb_tg_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port        = 80
  protocol    = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
