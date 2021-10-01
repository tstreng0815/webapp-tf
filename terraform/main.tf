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

