resource_group_name              = "prdrg"
resource_group_location          = "westeurope"
tags                             = {application = "DotnetAppService", unit ="D&A" }
storage_account                  = "Straccntdemoprd"
account_tier                     = "standard"
account_replication_type         = "RAGRS"
number_of_containers             = 3
storage_container                = ["error","standard","log"]
container_type                   = "private"
key_vault_existing               = "keycrdev"
resource_group_existing_keyvault = "keyvaltrg"
azuread_login_name               = "AD Group name"
azuread_objectid                 = "AD group object ID"
firewallrule_number              = 3
firewall_name                    = ["firewall1","firewall2","allow"]
start_ip_address                 = ["165.225.240.0","193.96.98.0","0.0.0.0"]
end_ip_address                   = ["165.225.240.255","193.96.98.225","0.0.0.0"]
sql_database_name                = "biappdb"
sql_collation                    = "SQL_Latin1_General_CP1_CI_AS"
sqldb_license_type               = "LicenseIncluded"
sqldb_max_size_gb                = 250
sqldb_skuname                    = "P4"
keyvault_secret_name             = "biappp01-admin"
app_service_plan_name            = "ASP-webapp-p01"
app_service_name                 = "webappp-p01"
app_plan_kind                    = "Linux"
app_plan_reserverd               = true
app_plan_sku_tier                = "Premium"
app_plan_sku_size                = "P3v2"
http2_enabled                    = true
linux_fx_version                 = "DOTNETCORE|5.0"
app_command_line                 = "dotnet webapp.Web.dll"
Autoscalename                    = "AutoscaleSet"
Settings_enabled                 = true
https_only                       = true
min_tls_version                  = "1.2"
Autoscale_profile_name           = "Scaling"
Capacity_default                 = 1
Capacity_minimum                 = 1
Capacity_maximum                 = 2
time_grain_scaleup               = "PT1M"
time_window_scaleup              = "PT10M"
threshold_scaleup                = 90
scaleup_action_value             = 1
scaleup_cooldown                 = "PT1M"
time_grain_scaledown             = "PT10M"
time_window_scaledown            = "PT10M"
threshold_scaledown              = 10
scaledown_action_value           = 1
scaledown_cooldown               = "PT1M"