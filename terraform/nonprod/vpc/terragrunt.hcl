include {
  # this includes the parent level terragrunt.hcl file which is required to run the plan
  path = find_in_parent_folders()
}

inputs = {
  # module variable inputs here
  environment               = local.env_vars.locals.environment
  tags                      = local.common_vars.locals.common_tags
  vpc_cidr                  = local.env_vars.locals.vpc_cidr
  vpc_subnet_public_a_cidr  = local.env_vars.locals.vpc_subnet_public_a_cidr
  vpc_subnet_public_b_cidr  = local.env_vars.locals.vpc_subnet_public_b_cidr
  vpc_subnet_public_c_cidr  = local.env_vars.locals.vpc_subnet_public_c_cidr
  vpc_subnet_private_a_cidr = local.env_vars.locals.vpc_subnet_private_a_cidr
  vpc_subnet_private_b_cidr = local.env_vars.locals.vpc_subnet_private_b_cidr
  vpc_subnet_private_c_cidr = local.env_vars.locals.vpc_subnet_private_c_cidr
}

locals {
  # list any local variable loading / definitions here
  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  env_vars    = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))
}

terraform {
  # path to the terraform module being used
  source = "../../modules//vpc"
}
