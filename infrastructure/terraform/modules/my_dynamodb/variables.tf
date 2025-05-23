variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode: PAY_PER_REQUEST or PROVISIONED"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "hash_key" {
  description = "Hash key name"
  type        = string
}

variable "hash_key_type" {
  description = "Hash key type (S, N, B)"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "Range key name (optional)"
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "Range key type (S, N, B)"
  type        = string
  default     = "S"
}

variable "tags" {
  description = "A map of tags to assign to the table"
  type        = map(string)
  default     = {}
}
