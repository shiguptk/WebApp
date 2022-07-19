

#provisioning azure SQL instance-----------
resource "azurerm_mssql_server" "sqldb" {
  name                         = "${var.sql_server_name}"
  resource_group_name          = "${var.resource_group_name}"
  location                     = "${var.resource_group_location}"
  version                      = "${var.sql_version}"
  administrator_login          = "${var.sql_admin_login}"
  administrator_login_password = "${var.sql_admin_password}"
  azuread_administrator {
    login_username = "${var.azuread_login_name}"
    object_id      = "${var.azuread_objectid}"
  }
  tags                         = "${var.tags}"
}

#provisioning Database-------------
resource "azurerm_mssql_database" "database" {
  # count          = 2
  # name           = element(var.sql_database_name, count.index)
  name           = "${var.sql_database_name}"
  server_id      = "${azurerm_mssql_server.sqldb.id}"
  collation      = "${var.sql_collation}"
  license_type   = "${var.sqldb_license_type}"
  max_size_gb    = "${var.sqldb_max_size_gb}"
  #read_scale     = true
  sku_name       = "${var.sqldb_skuname}"
  #zone_redundant = true
  # count                 = 2
  # name                  = element(var.sql_database_name, count.index)
  tags           = "${var.tags}"

  # extended_auditing_policy {
  #   storage_endpoint                        = azurerm_storage_account.storage.primary_blob_endpoint
  #   storage_account_access_key              = azurerm_storage_account.storage.primary_access_key
  #   storage_account_access_key_is_secondary = true
  #   retention_in_days                       = 6
  # }

}

resource "azurerm_mssql_firewall_rule" "main" {
    count                       = "${var.firewallrule_number}"
    name                        = "${element(var.firewall_name, count.index)}"
    server_id                   = "${azurerm_mssql_server.sqldb.id}"
    start_ip_address            = "${element(var.start_ip_address, count.index)}"
    end_ip_address              = "${element(var.end_ip_address, count.index)}"
}