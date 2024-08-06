terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = "rg-${var.project_name}-${var.env}"
  location = "Central India"
  tags = {
    environment : var.env
    application_name = var.project_name
  }
}
