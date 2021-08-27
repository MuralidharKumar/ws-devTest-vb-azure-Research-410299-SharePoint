terraform {
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>2.45"
        }
    }
}
provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "test-rg" {
    name = var.rg_name
    location = var.location
    
}
