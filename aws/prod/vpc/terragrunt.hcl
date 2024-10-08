terraform {
  source = "../../../modules/vpc"
}

include {
  path = find_in_parent_folders()
}


locals {
  account_vars     = yamldecode(file(find_in_parent_folders("account.yaml", find_in_parent_folders("empty.yaml"))))
  environment_vars = yamldecode(file(find_in_parent_folders("env.yaml", find_in_parent_folders("empty.yaml"))))
  config_vars      = yamldecode(file(find_in_parent_folders("config.yaml", find_in_parent_folders("empty.yaml"))))
}

inputs = {
  aws_region  = local.account_vars.aws_region
  environment = local.environment_vars.environment
}
