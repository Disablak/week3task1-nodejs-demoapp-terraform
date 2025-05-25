terraform {
  source = "../../../terraform/common/cloudwatch_and_sns/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

include "common" {
  path = "${get_terragrunt_dir()}/../../common/cloudwatch_and_sns/terragrunt.hcl"
}

inputs = {
  alarm_treshold = 10
}
