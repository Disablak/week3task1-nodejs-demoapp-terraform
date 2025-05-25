terraform {
  source = "../../../terraform/common/amazon_inspector/"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}
