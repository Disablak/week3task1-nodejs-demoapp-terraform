resource "aws_launch_template" "demoapp" {
  name_prefix   = "demoapp-"
  image_id      = "ami-0953476d60561c955"
  instance_type = var.instance_type
  user_data     = var.user_data //base64encode(file("../../../week3_task1/user_data/user_data.sh"))

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_http_and_ssh.id]
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  tags = {
    Name = "${var.enviroment}-demoapp"
  }
}

resource "aws_security_group" "allow_http_and_ssh" {
  name        = "demoapp-sg"
  vpc_id      = var.vpc_id
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

resource "aws_iam_role" "ec2_app" {
  name = "ec2-nodejs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "documentdb_access" {
  name        = "documentdb-ec2-access"
  description = "Allow EC2 to read DocumentDB"
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_app.name
  policy_arn = aws_iam_policy.documentdb_access.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-documentdb-profile"
  role = aws_iam_role.ec2_app.name
}
