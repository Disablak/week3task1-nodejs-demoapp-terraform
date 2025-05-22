terraform {
  source = "../../../terraform/envs/dev/ec2/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

inputs = {
  instance_type = "t3.micro"
}