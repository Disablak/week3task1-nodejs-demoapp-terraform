terraform {
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
} // generate this shit

resource "aws_autoscaling_group" "main" {
  desired_capacity    = 2
  min_size            = 2
  max_size            = 4
  vpc_zone_identifier = [var.subnet_a_id, var.subnet_b_id]
  target_group_arns   = [var.lb_target_group_arn]

  launch_template {
    id      = var.launch_template_id //aws_launch_template.demoapp.id
    version = "$Latest"
  }
}

variable "subnet_a_id" {
  type = string
}

variable "subnet_b_id" {
  type = string
}

variable "launch_template_id" {
  type = string
}

variable "lb_target_group_arn" {
  type = string
}

output "autoscale_group_name" {
  value = aws_autoscaling_group.main.name
}