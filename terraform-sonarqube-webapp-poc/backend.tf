terraform {
  backend "azurerm" {
    resource_group_name  = "rg"
    storage_account_name = "storageaccountrashika"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
  }
}