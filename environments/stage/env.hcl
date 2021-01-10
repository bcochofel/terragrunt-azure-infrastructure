# Set common variables for the environment.
# This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment = "stage"

  vnet = {
    northeurope = {
      vnet_cidr = "10.0.0.0/16"
    }
    westeurope = {
      vnet_cidr = "10.1.0.0/16"
    }
  }
}
