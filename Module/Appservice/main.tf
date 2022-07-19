#provisioning plan for web app-------------
resource "azurerm_app_service_plan" "app_plan" {
  name                = "${var.app_service_plan_name}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  kind                = "${var.app_plan_kind}"
  reserved            = "${var.app_plan_reserverd}"
  sku {
    tier = "${var.app_plan_sku_tier}"
    size = "${var.app_plan_sku_size}"
  }
  tags                = "${var.tags}"
  
}


# output "app_service_plan_id" {
#   value = azurerm_app_service_plan.app_plan.id
# }
# data "azurerm_app_service_plan" "app_plan" {
#     name                = "${var.app_service_name}"
#     resource_group_name = "${var.resource_group_name}"
# }
#provisioning web app----------------
resource "azurerm_app_service" "webapp" {
  name                = "${var.app_service_name}"
  location            = "${var.resource_group_location}"
  resource_group_name = "${var.resource_group_name}"
  app_service_plan_id = "${azurerm_app_service_plan.app_plan.id}"
  tags                = "${var.tags}"
  https_only          = "${var.https_only}"

  site_config {
    http2_enabled = true
    min_tls_version = "${var.min_tls_version}"
    linux_fx_version = "${var.linux_fx_version}"
    app_command_line = "${var.app_command_line}"
  }

  #app_settings = "${var.app_settings}"
  # connection_string {
  #   name  = "Database"
  #   type  = "SQLAzure"
  #   value = "Server=tcp:azurerm_mssql_server.sqldb.fully_qualified_domain_name Database=azurerm_mssql_database.db.name;User ID=azurerm_mssql_server.sqldb.administrator_login;Password=azurerm_mssql_server.sqldb.administrator_login_password;Trusted_Connection=False;Encrypt=True;"
  # }
}

resource "azurerm_monitor_autoscale_setting" "AutoScale" {
  name                = "${var.Autoscalename}"
  enabled             = "${var.Settings_enabled}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.resource_group_location}"
  target_resource_id  = "${azurerm_app_service_plan.app_plan.id}"
  profile {
    name = "${var.Autoscale_profile_name}"
    capacity {
      default = "${var.Capacity_default}"
      minimum = "${var.Capacity_minimum}"
      maximum = "${var.Capacity_maximum}"
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = "${azurerm_app_service_plan.app_plan.id}"
        time_grain         = "${var.time_grain_scaleup}"
        statistic          = "Average"
        time_window        = "${var.time_window_scaleup}"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = "${var.threshold_scaleup}"
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "${var.scaleup_action_value}"
        cooldown  = "${var.scaleup_cooldown}"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "CpuPercentage"
        metric_resource_id = "${azurerm_app_service_plan.app_plan.id}"
        time_grain         = "${var.time_grain_scaledown}"
        statistic          = "Average"
        time_window        = "${var.time_window_scaledown}"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = "${var.threshold_scaledown}"
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "${var.scaledown_action_value}"
        cooldown  = "${var.scaledown_cooldown}"
      }
    }
  }  
}