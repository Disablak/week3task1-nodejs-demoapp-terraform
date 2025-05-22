terraform {
  source = "../../../terraform/common/load_balancer.tf"
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

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  subnet_a_id = dependency.vpc.outputs.subnet_a_id
  subnet_b_id = dependency.vpc.outputs.subnet_b_id
}
