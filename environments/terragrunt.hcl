locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
EOF
}

remote_state {
  backend = "azure"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    resource_group_name  = get_env("TF_BACKEND_RESOURCE_GROUP_NAME", "rg-demolab-tf-001")
    storage_account_name = get_env("TF_BACKEND_STORAGE_ACCOUNT_NAME", "stdemolabtf001")
    container_name       = get_env("TF_BACKEND_CONTAINER_NAME", "scdemolabtf001")
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

terraform {
  extra_arguments "plan_vars" {
    commands = [
      "plan",
    ]

    arguments = [
      "-out",
      "plan.tfplan",
    ]
  }

  extra_arguments "apply_vars" {
    commands = [
      "apply",
    ]

    arguments = [
      "-auto-approve",
      "-input=false",
      "plan.tfplan",
    ]
  }

  after_hook "tflint" {
    commands = ["validate"]
    execute  = ["tflint", "--module", "."]
  }

  #  after_hook "show" {
  #    commands = ["plan"]
  #    execute  = ["terraform", "show", "-no-color", "-json", "plan.tfplan"]
  #  }

  after_hook "debug" {
    commands = ["plan"]
    execute  = ["tf_compliance.sh", "plan.tfplan", "/opt/projects/bcochofel/terraform-compliance/opa/"]
  }
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.environment_vars.locals,
  local.region_vars.locals,
)
