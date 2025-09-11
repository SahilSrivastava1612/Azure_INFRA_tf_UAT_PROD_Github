resource "azurerm_bastion_host" "bastion_block" {
  name                = var.bastion_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.data_subnet_block.id
    public_ip_address_id = data.azurerm_public_ip.data_public_ip_block.id
  }
}