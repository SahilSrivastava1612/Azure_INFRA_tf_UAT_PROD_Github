data "azurerm_subnet" "data_subnet_block" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "data_public_ip_block" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}

# NIC1 ke liye data block
data "azurerm_network_interface" "data_nic1_block" {
  name                = "nic-uat-vm-0001"
  resource_group_name = "rg1-uat-0001"
}

# NIC2 ke liye data block
data "azurerm_network_interface" "data_nic2_block" {
  name                = "nic-uat-vm-0002"
  resource_group_name = "rg1-uat-0001"
}