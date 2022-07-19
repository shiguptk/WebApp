resource "azurerm_storage_account" "storage" {
  #Variables are coming from variable.tf.json file 
  name                     = var.storage_account
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  #resource group name and location taken from resource "azurerm_resource_group" "rg"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.resource_group_location}"

  tags     = var.tags
}  

#provisioning container----------------
resource "azurerm_storage_container" "container" {
  count                 = "${var.number_of_containers}"
  name                  = element(var.storage_container, count.index)
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "${var.container_type}"
}

resource "azurerm_storage_management_policy" "StoragePolicy" {
  storage_account_id = "${azurerm_storage_account.storage.id}"

  rule {
    name    = "LifeCycle"
    enabled = true
    filters {
      blob_types   = ["blockBlob","appendBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than      = 60
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 60
      }
      version {
        delete_after_days_since_creation = 60
      }
    }
  }
}
