# list all dependencies here
dependency "vpc" {
  config_path = "../vpc"
}

include {
  # this includes the parent level terragrunt.hcl file which is required to run the plan
  path = find_in_parent_folders()
}

inputs = {
  # module variable inputs here
  environment         = local.env_vars.locals.environment
  tags                = local.common_vars.locals.common_tags
  private_subnet_a_id = dependency.vpc.outputs.private_subnet_a_id
  private_subnet_b_id = dependency.vpc.outputs.private_subnet_b_id
  private_subnet_c_id = dependency.vpc.outputs.private_subnet_c_id
  vpc_id              = dependency.vpc.outputs.vpc_id
}

locals {
  # list any local variable loading / definitions here
  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  env_vars    = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  # path to the terraform module being used
  source = "../../modules//web_stack"
}
