# terragrunt-azure-infrastructure

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![GitHub license](https://img.shields.io/github/license/bcochofel/terragrunt-azure-infrastructure.svg)](https://github.com/bcochofel/terragrunt-azure-infrastructure/blob/master/LICENSE)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/bcochofel/terragrunt-azure-infrastructure)](https://github.com/bcochofel/terragrunt-azure-infrastructure/tags)
[![GitHub issues](https://img.shields.io/github/issues/bcochofel/terragrunt-azure-infrastructure.svg)](https://github.com/bcochofel/terragrunt-azure-infrastructure/issues/)
[![GitHub forks](https://img.shields.io/github/forks/bcochofel/terragrunt-azure-infrastructure.svg?style=social&label=Fork&maxAge=2592000)](https://github.com/bcochofel/terragrunt-azure-infrastructure/network/)
[![GitHub stars](https://img.shields.io/github/stars/bcochofel/terragrunt-azure-infrastructure.svg?style=social&label=Star&maxAge=2592000)](https://github.com/bcochofel/terragrunt-azure-infrastructure/stargazers/)

Deploy Azure Infrastructure with Terraform/Terragrunt

# pre-commit hooks

This repo can be configure to use `pre-commit` hooks.

After [installing `pre-commit`](https://pre-commit.com/#install) just execute:

```bash
pre-commit install
```

You can run specific hooks on all files:

```bash
pre-commit run terragrunt-hclfmt -a
```

or you can run all the hooks:

```bash
pre-commit run -a
```

## pre-commit hooks dependencies

To run the hooks configured for this repository you need:

* [`pre-commit`](https://pre-commit.com/#install)
* [`TFLint`](https://github.com/terraform-linters/tflint)
* [`terraform-docs`](https://github.com/terraform-docs/terraform-docs)

# References

* [Keep a changelog](https://keepachangelog.com/en/1.0.0/)
* [Changelog generator](https://github.com/git-chglog/git-chglog)
* [GitTools/GitVersion](https://github.com/GitTools/GitVersion)
* [GitTools/GitReleaseManager](https://github.com/GitTools/GitReleaseManager)
* [GitTools actions](https://github.com/GitTools/actions)
* [Out-of-the-box pre-commit hooks](https://github.com/pre-commit/pre-commit-hooks)
* [Gruntwork pre-commit hooks](https://github.com/gruntwork-io/pre-commit)
* [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftnetwork)
* [Resource providers for Azure services](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers)
* [Azure Define your naming convention](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming)
* [Azure Recommended abbreviations for Azure resource types](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
* [Terraform Versions Constraints](https://www.terraform.io/docs/configuration/version-constraints.html)
