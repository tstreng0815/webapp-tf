terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.72.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ws-devops"
    storage_account_name = "cgmsgtf"
    container_name       = "tfstateazdevops"
    key                  = "47110815.tfstate"
  }
}

provider "azurerm" {
  features {}
}
#Get resource group
data "azurerm_resource_group" "wsdevops" {
  name = "ws-devops"
}
resource "azurerm_app_service_plan" "sp1" {
  name                = "<asp47110815"
  location            = data.azurerm_resource_group.wsdevops.location
  resource_group_name = data.azurerm_resource_group.wsdevops.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
