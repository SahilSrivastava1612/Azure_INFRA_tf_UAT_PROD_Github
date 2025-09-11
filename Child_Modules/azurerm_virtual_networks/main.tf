resource "azurerm_virtual_network" "vnet_block" {
  
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "subnet_block" {
  
  for_each = var.subnets
  name                 = each.value.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_block.name
  address_prefixes     = each.value.address_prefixes
}