variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "enviroment" {
  type = string
}

variable "alarm_treshold" {
  type = number
  default = 70
}

variable "sns_email" {
  type = string
  default = "verchinskiymax@gmail.com"
}