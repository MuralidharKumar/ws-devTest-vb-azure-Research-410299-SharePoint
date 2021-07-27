data "azurerm_virtual_network" "tlz_network_virtual_network" {
  provider            = azurerm.corenetwork
  name                = "tlz-stage-core-prod-network-vnet-centralus"
  resource_group_name = "tlz-stage-core-prod-network-rg"
}

module "tlz_core_logging_virtual_network_peering_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-vnet-peering/azurerm"
  version              = "~> 1.0.0"
  location             = var.region_primary
  environment          = local.environment
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name = module.tlz_core_logging_virtual_network_primary.vnet.name
  vnet_peerings = {
    logging_to_network = {
      name                         = "logging-to-network"
      remote_virtual_network       = data.azurerm_virtual_network.tlz_network_virtual_network.id
      allow_virtual_network_access = true
      allow_forwarded_traffic      = true
      allow_gateway_transit        = false
      use_remote_gateways          = true
    }
  }
  depends_on = [module.tlz_core_logging_virtual_network_primary]
}
