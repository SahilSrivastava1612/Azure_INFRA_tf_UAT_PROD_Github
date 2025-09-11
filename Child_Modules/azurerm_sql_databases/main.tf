resource "azurerm_mssql_database" "sql_databases_block" {

  for_each = var.sql_databases

  name                = each.value.db_name
  server_id           = data.azurerm_mssql_server.data_sql_server_block.id
  collation           = each.value.collation
  max_size_gb         = each.value.max_size_gb
  sku_name            = each.value.sku_name 

}