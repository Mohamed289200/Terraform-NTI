resource "aws_lb_target_group" "tg" {

  name     = "web-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = module.networking.vpc_id

  health_check {
    path = "/"
  }
}