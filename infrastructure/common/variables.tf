variable "ami_amazon_linux_id" {
  type        = string
  default     = "ami-0953476d60561c955"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "path_to_user_data" {
  type = string
  default = "/../../week3_task1/user_data.sh"
}