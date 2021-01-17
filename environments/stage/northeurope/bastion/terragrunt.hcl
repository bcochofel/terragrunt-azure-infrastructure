locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract out common variables for reuse
  env                = local.environment_vars.locals.environment
  location           = local.region_vars.locals.location
  location_shortname = local.region_vars.locals.location_shortname

  snet_cidr = local.environment_vars.locals.network[local.location].bastion_snet_cidr
}

terraform {
  source = "github.com/bcochofel/terraform-azurerm-modules//modules/bastion_vm"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vnet"]
}

dependency "vnet" {
  config_path = "../vnet"

  # Configure mock outputs for the `validate` command that are returned when there are no outputs available (e.g the
  # module hasn't been applied yet.
  #mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    vnet_name = "fake-vnet-name"
    rg_name   = "fake-rg-name"
  }
}

inputs = {
  rg_name = "rg-bastion-${local.env}-${local.location_shortname}-001"

  custom_tags = {
    Environment = "${local.env}"
  }

  vnet_name = dependency.vnet.outputs.vnet_name
  vnet_rg   = dependency.vnet.outputs.rg_name

  snet_name          = "snet-bastion-${local.env}-${local.location_shortname}-001"
  snet_addr_prefixes = "${local.snet_cidr}"
  pip_name           = "pip-bastion-${local.env}-${local.location_shortname}-001"
  nsg_name           = "nsg-bastion-${local.env}-${local.location_shortname}-001"
  nic_name           = "nic-bastion-${local.env}-${local.location_shortname}-001"
  vm_name            = "vm-bastion-${local.env}-${local.location_shortname}-001"

  admin_ssh_key = {
    username   = "adminuser"
    public_key = get_env("SSH_PUBLIC_KEY")
  }
}
