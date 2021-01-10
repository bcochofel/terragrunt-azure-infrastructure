# Set common variables for the environment.
# This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment = "stage"

  vnet = {
    northeurope = {
      address_space = "10.0.0.0/16"
    }
    westeurope = {
      address_space = "10.1.0.0/16"
    }
  }
}
