data "azurerm_mssql_server" "data_sql_server_block" {
  name                = var.sqlservername
  resource_group_name = var.rg
}