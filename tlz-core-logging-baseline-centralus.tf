module "tlz_core_logging_resource_group_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-resource-group/azurerm"
  version              = "~> 1.0.0"
  rg_name              = var.rg_name
  environment          = local.environment
  platform_environment = local.platform_environment
  account_type         = local.account_type
  location             = var.region_primary
  tags                 = module.tags.tags_as_list_of_maps
}

module "tlz_core_logging_virtual_network_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-virtual-network/azurerm"
  version              = "~> 1.0.0"
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  address_space        = var.vnet_address_space
  environment          = local.environment
  location             = var.region_primary
  vnet_name            = "logging"
  platform_environment = local.platform_environment
  account_type         = local.account_type
  tags                 = module.tags.tags_as_list_of_maps
  depends_on           = [module.tlz_core_logging_resource_group_primary]
}

module "tlz_core_logging_private_subnet_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-subnet/azurerm"
  version              = "~> 1.0.0"
  subnets              = var.private_subnet_cidrs
  subnet_name          = ["private"]
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name = module.tlz_core_logging_virtual_network_primary.vnet.name
  tags                 = module.tags.tags_as_list_of_maps
  depends_on           = [module.tlz_core_logging_virtual_network_primary]
}

module "tlz_core_logging_public_subnet_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-subnet/azurerm"
  version              = "~> 1.0.0"
  subnets              = var.public_subnet_cidrs
  subnet_name          = ["public"]
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name = module.tlz_core_logging_virtual_network_primary.vnet.name
  tags                 = module.tags.tags_as_list_of_maps
  depends_on           = [module.tlz_core_logging_virtual_network_primary]
}

module "tlz_core_logging_nsg_primary" {
  source                      = "tfe.farmersinsurance.com/fi-prod/stage-nsg/azurerm"
  version                     = "~> 1.0.0"
  name                        = "logging"
  attach_mgmt_nsg_rules_linux = true
  attach_mgmt_nsg_rules_win   = true
  resource_group_name         = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name        = module.tlz_core_logging_virtual_network_primary.vnet.name
  location                    = var.region_primary
  tags                        = module.tags.tags_as_list_of_maps
  depends_on                  = [module.tlz_core_logging_virtual_network_primary]
}

module "tlz_core_logging_routes_private_primary" {
  source           = "tfe.farmersinsurance.com/fi-prod/stage-routes/azurerm"
  version          = "~> 1.0.0"
  route_table_name = "tlz-stage-core-prod-logging-vnet-centralus-route-private"
  route_definition = {
    AllowVNG = {
      route_name     = "private"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "VirtualNetworkGateway"
    }
  }
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name = module.tlz_core_logging_virtual_network_primary.vnet.name
  depends_on           = [module.tlz_core_logging_virtual_network_primary, module.tlz_core_logging_private_subnet_primary, module.tlz_core_logging_public_subnet_primary]
}

module "tlz_core_logging_routes_public_primary" {
  source           = "tfe.farmersinsurance.com/fi-prod/stage-routes/azurerm"
  version          = "~> 1.0.0"
  route_table_name = "tlz-stage-core-prod-logging-vnet-centralus-route-public"
  route_definition = {
    AllowVNG = {
      route_name     = "public"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "VirtualNetworkGateway"
    }
  }
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  virtual_network_name = module.tlz_core_logging_virtual_network_primary.vnet.name
  depends_on           = [module.tlz_core_logging_virtual_network_primary, module.tlz_core_logging_private_subnet_primary, module.tlz_core_logging_public_subnet_primary]
}

module "tags" {
  source  = "tfe.farmersinsurance.com/fi-prod/stage-tags/azurerm"
  version = "~> 1.0.0"
  tags    = var.tags
}
