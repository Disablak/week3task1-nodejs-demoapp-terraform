dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id = "mock_vpc_id"
    subnet_a_id = "mock_subnet_a"
    subnet_b_id = "mock_subnet_b"
  }
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
  subnet_a_id = dependency.vpc.outputs.subnet_a_id
  subnet_b_id = dependency.vpc.outputs.subnet_b_id
}
