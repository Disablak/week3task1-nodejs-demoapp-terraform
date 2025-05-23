dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    subnet_a_id = "mock_subnet_a"
    subnet_b_id = "mock_subnet_b"
  }
}

dependency "ec2" {
  config_path = "../ec2"

  mock_outputs = {
    launch_template_id = "lt-12345"
  }
}

dependency "lb" {
  config_path = "../load_balancer"

  mock_outputs = {
    lb_target_group_arn = "mock_lb"
  }
}

inputs = {
  subnet_a_id = dependency.vpc.outputs.subnet_a_id
  subnet_b_id = dependency.vpc.outputs.subnet_b_id

  launch_template_id = dependency.ec2.outputs.launch_template_id
  lb_target_group_arn = dependency.lb.outputs.lb_target_group_arn
}
