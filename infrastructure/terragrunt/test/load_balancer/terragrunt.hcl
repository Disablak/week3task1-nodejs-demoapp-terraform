terraform {
  source = "../../../terraform/common/load_balancer/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "env" {
  path = find_in_parent_folders("env.hcl")
}

include "module" {
  path = "../../common/load_balancer/terragrunt.hcl"
}