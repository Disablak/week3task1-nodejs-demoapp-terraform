dependency "autoscale" {
  config_path = "../autoscale"

  mock_outputs = {
    autoscale_group_name = "mock-autoscale-group"
  }
}

inputs = {
  autoscale_group_name = dependency.autoscale.outputs.autoscale_group_name
}
