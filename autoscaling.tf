resource "aws_autoscaling_group" "web_asg" {

  name = "web-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = [
    module.networking.public_subnet_1,
    module.networking.public_subnet_2
  ]

  target_group_arns = [
    aws_lb_target_group.tg.arn
  ]

  launch_template {

    id = aws_launch_template.web_lt.id

    version = "$Latest"
  }

  health_check_type = "ELB"

  tag {

    key = "Name"

    value = "ASG-Web"

    propagate_at_launch = true
  }
}


resource "aws_autoscaling_policy" "cpu_policy" {

  name                   = "cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.web_asg.name

  policy_type = "TargetTrackingScaling"

  target_tracking_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 70
  }
}