resource "aws_lb" "alb" {

  name = "main-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    module.networking.public_subnet_1,
    module.networking.public_subnet_2
  ]
}