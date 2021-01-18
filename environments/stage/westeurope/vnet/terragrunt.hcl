locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract out common variables for reuse
  env                = local.environment_vars.locals.environment
  location           = local.region_vars.locals.location
  location_shortname = local.region_vars.locals.location_shortname

  vnet_cidr = local.environment_vars.locals.network[local.location].vnet_cidr
}

terraform {
  source = "github.com/bcochofel/terraform-azurerm-modules//modules/vnet"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  rg_name = "rg-base-${local.env}-${local.location_shortname}-001"

  ddos_protection_plan_name = "ddospp-base-${local.env}-${local.location_shortname}-001"
  vnet_name                 = "vnet-base-${local.env}-${local.location_shortname}-001"
  address_space             = "${local.vnet_cidr}"
}
