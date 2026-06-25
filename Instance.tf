
data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

# Key Pair for SSH
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key

  tags = {
    Name = "deployer-key"
  }
}

# EC2 Instance with Remote Provisioner
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = module.networking.public_subnet_1
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.deployer.key_name

  tags = {
    Name = "Web-Server"
  }

  # Remote Provisioner
  provisioner "remote-exec" {
    inline = [
      "echo 'Provisioning Web Server'",
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "echo '<h1>Welcome to Web Server</h1>' | sudo tee /var/www/html/index.html"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file(var.private_key_path)
      host        = self.public_ip
      timeout     = "2m"
    }
  }
}

