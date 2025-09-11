data "azurerm_container_registry" "data_acr_block" {
  name                = var.acr_name
  resource_group_name = var.acr_resource_group_name
}