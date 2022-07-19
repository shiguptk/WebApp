#calling storage module
module storage {
  source                   = "./module/Storage"
  storage_account          = "${var.storage_account}"
  account_tier             = "${var.account_tier}"
  account_replication_type = "${var.account_replication_type}"
  number_of_containers     = "${var.number_of_containers}"
  storage_container        = "${var.storage_container}"
  # resource_group_name      = module.resourcegroup.azurerm_resource_group_name
  # resource_group_location  = module.resourcegroup.azurerm_resource_group_location
  resource_group_name      = "${var.resource_group_name}"
  resource_group_location  = "${var.resource_group_location}"
  tags                     = "${var.tags}"
}

#calling sql module
module sqlserver {
  source                       = "./module/Sql"
  sql_server_name              = "${var.sql_server_name}"
  resource_group_name          = "${var.resource_group_name}"
  resource_group_location      = "${var.resource_group_location}"
  sql_admin_login              = "${jsondecode(data.azurerm_key_vault_secret.kvsecret.value)["User"]}"
  sql_admin_password           = "${jsondecode(data.azurerm_key_vault_secret.kvsecret.value)["Password"]}"
  sql_database_name            = "${var.sql_database_name}"
  azuread_login_name           = "${var.azuread_login_name}"
  azuread_objectid             = "${var.azuread_objectid}"
  sql_collation                = "${var.sql_collation}"
  sqldb_license_type           = "${var.sqldb_license_type}"
  sqldb_max_size_gb            = "${var.sqldb_max_size_gb}"
  sqldb_skuname                = "${var.sqldb_skuname}"
  firewallrule_number          = "${var.firewallrule_number}"
  firewall_name                = "${var.firewall_name}"
  start_ip_address             = "${var.start_ip_address}"
  end_ip_address               = "${var.end_ip_address}"
  # count                        = 2
  # sql_database_name            = element(var.sql_database_name, count.index)
  tags                         = "${var.tags}"
}


#data from existing keyvault
data "azurerm_key_vault" "terrakv" {
  name                = "${var.key_vault_existing}" // KeyVault name
  resource_group_name = "${var.resource_group_existing_keyvault}" // resourceGroup
}

#data secret from existing keyvault
data "azurerm_key_vault_secret" "kvsecret" {
name = "${var.keyvault_secret_name}" // Name of secret
key_vault_id = data.azurerm_key_vault.terrakv.id
#content_type = "JSON"
}

# output "secret_value" {
#   value = "${data.azurerm_key_vault_secret.kvsecret.value}"
# }

#calling appservice module
module appservice {
  source                      = "./module/appservice"
  app_service_plan_name       = "${var.app_service_plan_name}"
  app_service_name            = "${var.app_service_name}"
  resource_group_location     = "${var.resource_group_location}"
  resource_group_name         = "${var.resource_group_name}"
  app_plan_kind               = "${var.app_plan_kind}"
  app_plan_reserverd          = "${var.app_plan_reserverd}"
  app_plan_sku_tier           = "${var.app_plan_sku_tier}"
  app_plan_sku_size           = "${var.app_plan_sku_size}"
  tags                        = "${var.tags}"
  http2_enabled               = "${var.http2_enabled}"
  linux_fx_version            = "${var.linux_fx_version}"
  app_command_line            = "${var.app_command_line}"
  Autoscalename               = "${var.Autoscalename}"
  Settings_enabled            = "${var.Settings_enabled}"
  https_only                  = "${var.https_only}"
  min_tls_version             = "${var.min_tls_version}"
  Autoscale_profile_name      = "${var.Autoscale_profile_name}"
  Capacity_default            = "${var.Capacity_default}"
  Capacity_minimum            = "${var.Capacity_minimum}"
  Capacity_maximum            = "${var.Capacity_maximum}"
  time_grain_scaleup          = "${var.time_grain_scaleup}"
  time_window_scaleup         = "${var.time_window_scaleup}"
  threshold_scaleup           = "${var.threshold_scaleup}"
  scaleup_action_value        = "${var.scaleup_action_value}"
  scaleup_cooldown            = "${var.scaleup_cooldown}"
  time_grain_scaledown        = "${var.time_grain_scaledown}"
  time_window_scaledown       = "${var.time_window_scaledown}"
  threshold_scaledown         = "${var.threshold_scaledown}"
  scaledown_action_value      = "${var.scaledown_action_value}"
  scaledown_cooldown          = "${var.scaledown_cooldown}"
}

