module "tlz_core_logging_eventhub_primary" {
  source               = "tfe.farmersinsurance.com/fi-prod/stage-log-eventhub/azurerm"
  evh_name             = "logging"
  version              = "~> 1.0.0"
  location             = var.region_primary
  resource_group_name  = module.tlz_core_logging_resource_group_primary.resource_group.name
  partition_count      = var.partition_count
  message_retention    = var.message_retention
  status               = try(var.status, false)
  environment          = local.environment
  platform_environment = local.platform_environment
  account_type         = local.account_type
  tags                 = module.tags.tags_as_list_of_maps
  #   capture_description {
  #     enabled             = try(var.enabled, false)
  #     encoding            = var.encoding
  #     interval_in_seconds = var.interval_in_seconds
  #     size_limit_in_bytes = var.size_limit_in_bytes # in Bytes
  #     skip_empty_archives = try(var.skip_empty_archives, false)

  #     destination {
  #       name                = "EventHubArchive.AzureBlockBlob"
  #       archive_name_format = "{Namespace}/{EventHub}/{PartitionId}/{Year}-{Month}-{Day}T{Hour}:{Minute}:{Second}"
  #       blob_container_name = var.blob_container_name
  #       storage_account_id  = module.tlz_core_monitor_storage_account_primary.storage_account_id
  #     }
  #   }
}
