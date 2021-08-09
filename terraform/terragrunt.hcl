

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  env_vars    = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))

  # Get the variables we need in this file
  aws_account_id = local.env_vars.locals.aws_account_id
  environment    = local.env_vars.locals.environment
  project_name   = local.common_vars.locals.project_name
  region         = local.common_vars.locals.region
}

# Generate AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region  = "${local.region}"
  allowed_account_ids = ["${local.aws_account_id}"]
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "${local.project_name}-state"
    dynamodb_table = "${local.project_name}-state-lock"
    encrypt        = true
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
  }
}
