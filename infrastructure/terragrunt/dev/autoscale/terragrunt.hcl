terraform {
  source = "../../../terraform/common/autoscale/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "module" {
  path = "../../common/autoscale/terragrunt.hcl"
}
