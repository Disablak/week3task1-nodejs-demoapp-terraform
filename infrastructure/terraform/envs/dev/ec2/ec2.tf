terraform {
  backend "s3" {}
}

resource "aws_launch_template" "demoapp" {
  name_prefix   = "demoapp-"
  image_id      = "ami-0953476d60561c955"
  instance_type = var.instance_type
  user_data     = base64encode(file("user_data.sh")) //base64encode(file("../../../../../week3_task1/user_data/user_data.sh"))

  network_interfaces {
    associate_public_ip_address = true
    // security_groups             = [aws_security_group.allow_http_and_ssh.id]
  }

  tags = {
    Name = "${var.enviroment}-demoapp"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "enviroment" {
  type = string
}