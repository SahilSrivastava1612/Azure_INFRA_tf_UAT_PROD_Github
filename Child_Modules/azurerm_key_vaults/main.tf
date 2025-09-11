resource "azurerm_key_vault" "key_vault_block" {
  
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = var.key_permissions
    secret_permissions = var.secret_permissions
    certificate_permissions = var.certificate_permissions
  }
}

resource "azurerm_key_vault_secret" "username" {
  name         = "username"
  value        = var.username                  # best: pass via variable
  key_vault_id = azurerm_key_vault.key_vault_block.id
}


resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = var.password                  # best: pass via variable
  key_vault_id = azurerm_key_vault.key_vault_block.id
}