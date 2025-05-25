terraform {
  source = "../../../terraform/common/autoscale/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "common" {
  path = "${get_terragrunt_dir()}/../../common/autoscale/terragrunt.hcl"
}
