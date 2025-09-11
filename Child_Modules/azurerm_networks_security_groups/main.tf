resource "azurerm_network_security_group" "nsg_block" {
  name                = var.nsg_block_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowAllInbound"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow all inbound traffic"
  }

  security_rule {
    name                       = "AllowAllOutbound"
    priority                   = 201
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow all outbound traffic"
  }

}
