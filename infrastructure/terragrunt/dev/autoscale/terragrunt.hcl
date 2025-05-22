terraform {
  source = "../../../terraform/common/autoscale.tf"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "ec2" {
  config_path = "../ec2"
}

dependency "lb" {
  config_path = "../load_balancer"
}

inputs = {
  launch_template_id = dependency.ec2.outputs.launch_template_id
  lb_target_group_arn = dependency.lb.outputs.lb_target_group_arn

  subnet_a_id = dependency.vpc.outputs.subnet_a_id
  subnet_b_id = dependency.vpc.outputs.subnet_b_id
}
