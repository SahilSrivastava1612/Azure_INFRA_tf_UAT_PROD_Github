resource "azurerm_mssql_server" "sql_server_block" {
  
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = data.azurerm_key_vault_secret.sql_admin_username.value
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password.value


}