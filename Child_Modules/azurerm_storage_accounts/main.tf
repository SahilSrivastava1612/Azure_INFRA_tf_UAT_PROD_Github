resource "azurerm_storage_account" "storage_account_block" {

  name                         = var.storage_account_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  account_tier                 = var.account_tier
  account_replication_type     = var.account_replication_type
}

resource "azurerm_storage_container" "storage_container_block" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.storage_account_block.id
  container_access_type = "private"
}