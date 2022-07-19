variable "resource_group_name" {
  type        = string
  default     ="c809nt6yssss"
  description = "RG name in Azure"
}

variable "resource_group_location" {
  type        = string
  default     ="eastus"
  description = "RG location in Azure"
}

variable "tags" {
  type        = map
  default     = {"application" : "application", "unit" :"IBS - D&A" }
  description = "tag name"
}

variable "storage_account" {
  type        = string
  default     = "straccndemodev"
  description = "storage account name"
}

variable "account_tier" {
  type        = string
  default     = "standard"
  description = "storage account tier name"
}

variable "account_replication_type" {
  type        = string
  default     = "RAGRS"
  description = "storage account replication type"
}

variable "container_type" {
  type        = string
  default     = "private"
  description = "storage account container type"
}

variable "number_of_containers" {
  type        = number
  default     = 3
  description = "number of containers"
}

variable "storage_container" {
  type        = list(string)
  default     = ["error","standard","log"]
  description = "storage container name"
}

variable "key_vault_existing" {
  type        = string
  default     = "keycrdev"
  description = "key vault name"
}

variable "keyvault_secret_name" {
  type        = string
  default     = "sqluser-admin"
  description = "key vault secret name"
}

variable "resource_group_existing_keyvault" {
  type        = string
  default     = "terraformaz"
  description = "key vault name"
}


variable "sql_server_name" {
  type        = string
  default     = "sqlsrvqua"
  description = "sql server name"
}

variable "sql_database_name" {
  type        = string
  default     = "sqldbsequa"
  description = "sql server DB name"
}

variable "azuread_login_name" {
  type        = string
  default     = "AD name"
  description = "azure ad admin login name"
}

variable "azuread_objectid" {
  type        = string
  default     = "356b167d-9867-8k3y-67j6-15672a569h"
  description = "azure ad admin object id name"
}

variable "sql_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "sql collation type"
}

variable "sqldb_license_type" {
  type        = string
  default     = "LicenseIncluded"
  description = "sql db license type"
}

variable "sqldb_max_size_gb" {
  type        = number
  default     = 250
  description = "sql db max size in GB"
}

variable "sqldb_skuname" {
  type        = string
  default     = "S0"
  description = "sql db sku name"
}

variable "firewallrule_number" {
  type        = number
  default     = 3
  description = "firewall rule number"
}

variable "firewall_name" {
  type        = list(string)
  default     = ["firewall1","firewall2","allow"]
  description = "firewall name"
}

variable "start_ip_address" {
  type        = list(string)
  default     = ["165.225.240.0","193.96.98.0","0.0.0.0"]
  description = "start ip adresses"
}

variable "end_ip_address" {
  type        = list(string)
  default     = ["165.225.240.255","193.96.98.225","0.0.0.0"]
  description = "end ip addresses"
}


variable "app_service_plan_name" {
  type        = string
  default     = "ASP-demo-dev01"
  description = "app service plan name"
}

variable "app_service_name" {
  type        = string
  default     = "demowebapplication-dev01"
  description = "app service plan name"
}

variable "app_plan_kind" {
  type        = string
  default     = "Linux"
  description = "app service plan kind"
}

variable "app_plan_reserverd" {
  type        = bool
  default     = true
  description = "app service plan reserve"
}

variable "app_plan_sku_tier" {
  type        = string
  default     = "Basic"
  description = "app service plan sku tier"
}

variable "app_plan_sku_size" {
  type        = string
  default     = "B1"
  description = "app service plan sku size"
}

variable "http2_enabled" {
  type        = bool
  default     = true
  description = "app service http2"
}

variable "linux_fx_version" {
  type        = string
  default     = "DOTNETCORE|5.0"
  description = "app service http2"
}

variable "app_command_line" {
  type        = string
  default     = "dotnet demo.Web.dll"
  description = "app service startup command"
}


variable "Autoscalename" {
  type        = string
  default     = "Autoscale"
  description = "Name of autoscale settings"
}

variable "Settings_enabled" {
  type        = bool
  default     = true
  description = "settings"
}

variable "https_only" {
  type        = bool
  default     = true
  description = "https only for webapp"
}

variable "min_tls_version" {
  type        = string
  default     = "1.2"
  description = "TLS settings for webapp"
}

variable "Autoscale_profile_name" {
  type        = string
  default     = "Scaling"
  description = "Autoscaling profile name for webapp"
}

variable "Capacity_default" {
  type        = number
  default     = 1
  description = "default autoscaling capacity for webapp"
}

variable "Capacity_minimum" {
  type        = number
  default     = 1
  description = "Minimum autoscaling capacity for webapp"
}

variable "Capacity_maximum" {
  type        = number
  default     = 2
  description = "Maximum autoscaling capacity for webapp"
}

variable "time_grain_scaleup" {
  type        = string
  default     = "PT1M"
  description = "time grain scale up for webapp"
}

variable "time_window_scaleup" {
  type        = string
  default     = "PT10M"
  description = "time window scale up for webapp"
}

variable "threshold_scaleup" {
  type        = number
  default     = 90
  description = "threshold scale up for webapp"
}

variable "scaleup_action_value" {
  type        = number
  default     = 1
  description = "scale up action for webapp"
}

variable "scaleup_cooldown" {
  type        = string
  default     = "PT1M"
  description = "scale up cooldown for webapp"
}

variable "time_grain_scaledown" {
  type        = string
  default     = "PT10M"
  description = "time grain scale down for webapp"
}

variable "time_window_scaledown" {
  type        = string
  default     = "PT10M"
  description = "time window scale down for webapp"
}

variable "threshold_scaledown" {
  type        = number
  default     = 1
  description = "threshold scale down for webapp"
}

variable "scaledown_action_value" {
  type        = number
  default     = 1
  description = "scale down action value for webapp"
}

variable "scaledown_cooldown" {
  type        = string
  default     = "PT1M"
  description = "scale down action value for webapp"
}

