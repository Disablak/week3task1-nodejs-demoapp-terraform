terraform {
  source = "../../../terraform/modules/my_dynamodb/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

inputs = {
  table_name     = "dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  hash_key_type  = "S"
  tags = {
    app          = "demoapp"
  }
}