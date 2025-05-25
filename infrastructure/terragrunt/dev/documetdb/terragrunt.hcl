terraform {
  source = "../../../terraform/common/documentdb/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}


dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "mock_vpc_id"
    subnet_a_id = "mock_subnet_a"
    subnet_b_id = "mock_subnet_b"
  }
}

dependency "ec2" {
  config_path = "../ec2"

  mock_outputs = {
    ec2_sg_id = "test_id"
  }
}


inputs = {
  name               = "docdb"
  vpc_id             = dependency.vpc.outputs.vpc_id
  subnet_ids         = [dependency.vpc.outputs.subnet_a_id, dependency.vpc.outputs.subnet_b_id]
  ec2_sg_id          = dependency.ec2.outputs.ec2_sg_id
  master_username    = "some_unique_username"
  master_password    = "securepassword123!"
  instance_count     = 1
  tags = {
    Project     = "example"
  }
}
