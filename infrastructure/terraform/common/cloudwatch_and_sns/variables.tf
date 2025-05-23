
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