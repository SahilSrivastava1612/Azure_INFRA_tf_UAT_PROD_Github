resource "azurerm_container_registry" "acr_block" {

  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  
}

