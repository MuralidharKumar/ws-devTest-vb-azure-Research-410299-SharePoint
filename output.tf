
output "resource_group" {
  value       = module.tlz_core_logging_resource_group_primary.resource_group.name
  description = "The name of the Resource Group."
}

output "vnet" {
  value       = module.tlz_core_logging_virtual_network_primary.vnet.id
  description = "The name of the virtual network."
}

output "vnet_name" {
  value       = module.tlz_core_logging_virtual_network_primary.vnet.name
  description = "The name of the virtual network."
}
output "private_subnet_id" {
  value       = module.tlz_core_logging_private_subnet_primary.subnet_id
  description = "The list of private subnet ids of the shared services subnets."
}

output "public_subnet_id" {
  value       = module.tlz_core_logging_public_subnet_primary.subnet_id
  description = "The list of public subnet ids of the shared services subnets."
}

output "nsg_id" {
  value       = module.tlz_core_logging_nsg_primary.nsg_id
  description = "The id of the network logging group."
}

output "log_analytics_workspace" {
  value       = module.tlz_core_monitor_log_analytics_workspace_primary.log_analytics_workspace.id
  description = "The id of the Log Analytics Workspace."
}

output "network_watcher" {
  value       = data.azurerm_network_watcher.network_watcher.id
  description = "The ID of Network Watcher."
}

output "storage_account_id" {
  value       = module.tlz_core_monitor_storage_account_primary.storage_account_id
  description = "The ID of the Storage Account."
}

output "private_route_id" {
  value       = module.tlz_core_logging_routes_private_primary.route_id
  description = "The Private Route ID."
}

output "public_route_id" {
  value       = module.tlz_core_logging_routes_public_primary.route_id
  description = "The Public Route ID."
}

output "private_route_name" {
  value       = module.tlz_core_logging_routes_private_primary.route_name
  description = "The Private Route name."
}

output "public_route_name" {
  value       = module.tlz_core_logging_routes_public_primary.route_name
  description = "The Public Route name."
}
