variable "name" {
  type        = string
  description = "Base name for resources"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ec2_sg_id" {
  type = string
}

variable "master_username" {
  type = string
}

variable "master_password" {
  type = string
  sensitive = true
}

variable "instance_class" {
  type    = string
  default = "db.r5.large"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}
