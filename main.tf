terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.70.0"
    }

    azuread = {
        source = "hashicorp/azuread"
        version = "=1.6.0"
    }
  }

}

provider "azurerm" {
  features {}
}

module "sp_create" {
    source = "./modules/sp_create"

    for_each = var.service_principals
    sp_name = each.key
    role_assignments = each.value.role_assignments
}