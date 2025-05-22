resource "aws_launch_template" "demoapp" {
  name_prefix   = "demoapp-"
  image_id      = "ami-0953476d60561c955"
  instance_type = var.instance_type
  user_data     = base64encode(file("user_data.sh"))

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_http_and_ssh.id]
  }

  tags = {
    Name = "${var.enviroment}-demoapp"
  }
}

resource "aws_security_group" "allow_http_and_ssh" {
  name        = "demoapp-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow HTTP and SSH"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}