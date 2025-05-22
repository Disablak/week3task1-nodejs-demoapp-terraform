include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../terraform/envs/dev/ec2_test/"
}

inputs = {
  instance_type = "t3.micro"
  enviroment = "dev"
}