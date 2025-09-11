data "azurerm_key_vault" "kv_block" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
}

# Username secret
data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.kv_block.id
}

# Password secret
data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.kv_block.id
}