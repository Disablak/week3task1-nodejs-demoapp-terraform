include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../terraform/envs/dev"
}

inputs = {
  alarm_treshold = 30
}