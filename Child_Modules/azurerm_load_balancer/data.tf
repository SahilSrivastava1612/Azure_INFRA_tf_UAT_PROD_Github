data "azurerm_public_ip" "data_public_ip_block" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_network_interface" "data_nic_block" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_network_interface" "data_nic_block2" {
  name                = var.nic_name2
  resource_group_name = var.resource_group_name
}