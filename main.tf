provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.64.0"
    }
  }
}

provider "azurerm" {
  features {}
  alias           = "corenetwork"
  subscription_id = var.network_subscription_id
}

data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = var.tfe_org_name
    hostname     = var.tfe_host_name
    workspaces = {
      name = var.tfe_network_workspace_name
    }
  }
}

data "azurerm_network_watcher" "network_watcher" {
  name                = "NetworkWatcher_${var.region_primary}"
  resource_group_name = "NetworkWatcherRG"
}
