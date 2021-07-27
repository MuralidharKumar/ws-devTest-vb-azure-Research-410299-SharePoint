# Primary region
variable "region_primary" {
  description = "(Required) The primary region in which resources will be deployed."
}

variable "vnet_address_space" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
}

variable "private_subnet_cidrs" {
  description = "(Optional) The address prefixes to use for the subnet."
}

variable "public_subnet_cidrs" {
  description = "(Optional) The address prefixes to use for the subnet."
}

#Tags

variable "tags" {
  default     = {}
  description = "Additional tags. Overwrite module-generated tags"
}
# Resource Group
variable "rg_name" {
  description = "(Required) The name of the resource group where to create the resource."
  default     = "logging"
}

# Log Analytics WorkSpace

variable "law_name" {
  description = "(Required) The name of the Log Analytics Workspace."
  default     = "logging"
}

variable "sku" {
  description = "SKU of the Log Analytics Workspace "
  default     = "PerGB2018"
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workflow support ingestion over the Public Internet?"
  default     = true
}

variable "internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workflow support querying over the Public Internet?"
  default     = true
}

variable "reservation_capcity_in_gb_per_day" {
  description = "Optional) The capacity reservation level in GB for this workspace."
  default     = 100
}

# Storage Account
variable "sa_name" {
  description = "Name of the storage account. (The field can contain only lowercase letters and numbers. Name must be between 3 and 24 characters.)"
  default     = "filogging"
}

variable "account_tier" {
  description = "Choose your account tier. Available Options (Standard & Premium)"
  default     = "Standard"
}

variable "account_kind" {
  description = "Select your account type. Valid options (BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2)"
  default     = "StorageV2"
}

variable "replication_type" {
  description = "Choose your application replication type. (Available Types - LRS, GRS, ZRS, GZRS)"
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled"
  default     = true
}

variable "retention_in_days" {
  description = "LAW (Optional) The workspace data retention in days."
  default     = 60
}

variable "daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB."
  default     = 1
}

variable "partition_count" {
  description = "(Required) Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created"
  default     = 1
}

variable "message_retention" {
  description = "Event Hub (Required) Specifies the number of days to retain the events for this Event Hub"
  default     = 7
}

variable "status" {
  description = "Status of eventhub resource"
  default     = "Active"
}

variable "enabled" {
  description = "Specifies if the Capture Description is Enabled"
  default     = true
}

# variable "encoding" {
#   description = "(Required) Specifies the Encoding used for the Capture Description."
#   default = "avro"
# }

# variable "interval_in_seconds" {
#   description = "(Optional) Specifies the time interval in seconds at which the capture will happen."
#   default = 300
# }

# variable "size_limit_in_bytes" {
#   description = "(Optional) Specifies the amount of data built up in your EventHub before a Capture Operation occurs."
#   default = 314572800
# }

# variable "skip_empty_archives" {
#   description = "(Optional) Specifies if empty files should not be emitted if no events occur during the Capture time window"
#   default = false
# }

# variable "blob_container_name" {
#   description = "(Required) The name of the Container within the Blob Storage Account where messages should be archived."
#   default = ""
# }

variable "min_tls_version" {
  description = "(Optional) The minimum supported TLS version for the storage account."
  default     = "TLS1_0"
}

variable "allow_blob_public_access" {
  description = "Allow or disallow public access to all blobs or containers in the storage account."
  default     = false
}

variable "nfsv3_enabled" {
  description = "NFSv3 protocol enabled?"
  default     = false
}

# aac
variable "automation_account_name" {
  type        = string
  description = "The name to assign to the new Automation Account."
  default     = "logging"
}

variable "sku_name" {
  type        = string
  description = "Only Basic SKU available at present"
  default     = "Basic"
}

# Network Watcher
variable "nw_name" {
  description = "(Required) The name of the network watcher."
  default     = "logging"
}

# Application Insights
variable "application_type" {
  description = " define application type as one of the following (IOS, Java, MobileCenter, Node.JS, Other, Phone, Store and Web)"
  default     = "web"
}

variable "daily_data_cap_in_gb" {
  description = "(Required) Daily data cap in GB"
  default     = 1
}

variable "daily_data_cap_notifications_disabled" {
  description = "(Required) Daily data cap Notifications Disabled"
  default     = true
}

variable "sampling_percentage" {
  description = "Specify the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry"
  default     = 50
}

variable "disable_ip_masking" {
  description = "IP Masking disable for Application Insights"
  default     = false
}

# Diagnostic Settings
variable "diagnostic_settings_name" {
  description = "Name for your Diagnostic Settings"
  default     = "logging"
}
# Vnet Peering
variable "tfe_host_name" {
  description = "host_name for ptfe"
}
variable "tfe_org_name" {
  description = "ptfe organization name"
}
variable "tfe_network_workspace_name" {
  description = "Name of network baseline workspace"
}
variable "network_subscription_id" {
  description = "A subscription id for remote network VNET for peering."
}
