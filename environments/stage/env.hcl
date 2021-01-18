# Set common variables for the environment.
# This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment = "stage"

  network = {
    northeurope = {
      vnet_cidr         = "10.0.0.0/16"
      bastion_snet_cidr = "10.0.1.0/24"
    }
    westeurope = {
      vnet_cidr         = "10.1.0.0/16"
      bastion_snet_cidr = "10.1.1.0/24"
    }
  }

  custom_tags = {
    Environment = "${local.environment}"
    ManagedBy   = "terraform"
    Project     = "DemoLab"
  }
}
