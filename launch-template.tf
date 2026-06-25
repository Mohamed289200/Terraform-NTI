resource "aws_launch_template" "web_lt" {

  name_prefix = "web-template"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd

              systemctl start httpd
              systemctl enable httpd

              echo "<h1>Terraform Auto Scaling Server</h1>" > /var/www/html/index.html
              EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "WebServer"
    }
  }
}