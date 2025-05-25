terraform {
  source = "../../../terraform/common/ec2/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

include "common" {
  path = "${get_terragrunt_dir()}/../../common/ec2/terragrunt.hcl"
}

inputs = {
  instance_type = "t2.micro"

  // can't share this line because of error
  user_data = base64encode(file("${get_parent_terragrunt_dir("root")}/../../week3_task1/user_data/user_data.sh"))
}