module "tlz_core_monitor_log_analytics_workspace_primary" {
    source                              = "tfe.farmersinsurance.com/fi-prod/stage-log-law/azurerm"
    version                             = "~> 1.0.0"
    law_name                            = var.law_name
    resource_group_name                 = module.tlz_core_logging_resource_group_primary.resource_group.name
    environment                         = local.environment
    platform_environment                = local.platform_environment
    account_type                        = local.account_type
    location                            = local.region
    sku                                 = var.sku
    retention_in_days                   = var.retention_in_days
    daily_quota_gb                      = var.daily_quota_gb
    internet_ingestion_enabled          = var.internet_ingestion_enabled
    internet_query_enabled              = var.internet_ingestion_enabled
    tags                                = module.tags.tags_as_list_of_maps
    depends_on                          = [module.tlz_core_logging_resource_group_primary]
}

module "tlz_core_monitor_storage_account_primary" {
    source                      = "tfe.farmersinsurance.com/fi-prod/stage-storage-account/azurerm"
    version                     = "~> 1.0.0"
    sa_name                     = var.sa_name
    resource_group_name         = module.tlz_core_logging_resource_group_primary.resource_group.name
    account_tier                = var.account_tier
    account_kind                = var.account_kind
    replication_type            = var.replication_type
    enable_https_traffic_only   = var.enable_https_traffic_only
    min_tls_version             = var.min_tls_version
    allow_blob_public_access    = var.allow_blob_public_access
    nfsv3_enabled               = var.nfsv3_enabled
    environment                 = local.environment
    platform_environment        = local.platform_environment
    account_type                = local.account_type
    location                    = local.region
    tags                        = module.tags.tags_as_list_of_maps
    depends_on                  = [module.tlz_core_logging_resource_group_primary]
}

module "tlz_core_monitor_aac_primary" {
    source                  = "tfe.farmersinsurance.com/fi-prod/stage-log-aac/azurerm"
    version                 = "~> 1.0.0"
    automation_account_name = var.automation_account_name
    platform_environment    = local.platform_environment
    account_type            = local.account_type
    environment             = local.environment
    resource_group_name     = module.tlz_core_logging_resource_group_primary.resource_group.name
    sku_name                = var.sku_name
    location                = local.region
    tags                    = module.tags.tags_as_list_of_maps
    depends_on              = [module.tlz_core_logging_resource_group_primary]
}

module "tlz_core_monitor_diagnostic_settings_primary" {
    source                                      = "tfe.farmersinsurance.com/fi-prod/stage-log-monitor/azurerm"
    version                                     = "~> 1.0.0"
    diagnostic_settings_name                    = var.diagnostic_settings_name
    resource_group_name                         = module.tlz_core_logging_resource_group_primary.resource_group.name
    environment                                 = local.environment
    location                                    = local.region
    platform_environment                        = local.platform_environment
    account_type                                = local.account_type
    target_resource_id                          = module.tlz_core_monitor_storage_account_primary.storage_account_id
    log_analytics_workspace_id                  = module.tlz_core_monitor_log_analytics_workspace_primary.log_analytics_workspace.id
    depends_on                                  = [module.tlz_core_logging_resource_group_primary, module.tlz_core_monitor_storage_account_primary, module.tlz_core_monitor_log_analytics_workspace_primary]
}

module "tlz_core_monitor_azure_defender_primary" {
    source                       = "tfe.farmersinsurance.com/fi-prod/stage-log-defender/azurerm"
    version                      = "~> 1.0.0"
    defender_setting_name        = "MCAS"
    rg_name                      = module.tlz_core_logging_resource_group_primary.resource_group.name
    defender_workspace_id        = module.tlz_core_monitor_log_analytics_workspace_primary.log_analytics_workspace.id
    defender_auto_provision      = "On"
    depends_on                   = [module.tlz_core_logging_resource_group_primary, module.tlz_core_monitor_log_analytics_workspace_primary]
}



# module "tlz_core_logging_resource_group_primary" {
#   source      = "tfe.farmersinsurance.com/fi-prod/stage-resource-group/azurerm"
#   version     = "~> 1.0.0"
#   rg_name     = var.rg_name
#   environment = local.environment
#   platform_environment = local.platform_environment
#   account_type         = local.account_type
#   location    = local.region
#   tags        = module.tags.tags_as_list_of_maps
# }

# module "tlz_core_monitor_network_watcher_primary" {
#     source                  = "tfe.farmersinsurance.com/fi-prod/stage-log-netwatcher/azurerm"
#     version                 = "~> 1.0.0"
#     nw_name                 = var.nw_name
#     resource_group_name     = module.tlz_core_logging_resource_group_primary.resource_group.name
#     environment             = local.environment
#     platform_environment = local.platform_environment
#     account_type         = local.account_type
#     location                = local.region
#     tags                    = module.tags.tags_as_list_of_maps
#     depends_on              = [module.tlz_core_logging_resource_group_primary]
# }
