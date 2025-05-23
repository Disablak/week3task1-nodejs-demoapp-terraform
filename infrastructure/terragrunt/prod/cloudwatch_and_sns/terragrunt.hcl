terraform {
  source = "../../../terraform/common/cloudwatch_and_sns/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

dependency "autoscale" {
  config_path = "../autoscale"

  mock_outputs = {
    autoscale_group_name = "mock-autoscale-group"
  }
}

inputs = {
  autoscale_group_name = dependency.autoscale.outputs.autoscale_group_name

  sns_email = "verchinskiymax@gmail.com"
  alarm_treshold = 70
}
