terraform {
  source = "../../../terraform/common/cloudwatch_and_sns.tf"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

dependency "autoscale" {
  config_path = "../autoscale"
}

inputs = {
  autoscale_group_name = dependency.autoscale.outputs.autoscale_group_name

  sns_email = "verchinskiymax@gmail.com"
  alarm_treshold = 30
}
