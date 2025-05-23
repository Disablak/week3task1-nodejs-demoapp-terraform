variable "vpc_id" {
  type = string
}

variable "subnet_a_id" {
  type = string
}

variable "subnet_b_id" {
  type = string
}

variable "enviroment" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "user_data" {
  type = string
}

variable "sns_email" {
  type = string
}

variable "alarm_treshold" {
  type = number
  default = 70
}

variable "autoscale_group_name" {
  type = string
}

variable "launch_template_id" {
  type = string
}

variable "lb_target_group_arn" {
  type = string
}