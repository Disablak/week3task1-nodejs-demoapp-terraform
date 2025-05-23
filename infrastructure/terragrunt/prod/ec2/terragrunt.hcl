terraform {
  source = "../../../terraform/common/ec2/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "mock-vpc-id"
  }
}

inputs = {
  instance_type = "t3.large"
  user_data = base64encode(file("${get_parent_terragrunt_dir("root")}/../../week3_task1/user_data/user_data.sh"))
  vpc_id = dependency.vpc.outputs.vpc_id
}
