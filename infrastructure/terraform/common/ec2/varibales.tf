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

variable "vpc_id" {
  type = string
}