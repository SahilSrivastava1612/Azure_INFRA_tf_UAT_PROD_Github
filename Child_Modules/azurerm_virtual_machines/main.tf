resource "azurerm_network_interface" "nic_block" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.data_subnet_block.id
    private_ip_address_allocation = "Dynamic"
  }
}

# VM Creation
resource "azurerm_linux_virtual_machine" "vm_block" {
  for_each            = var.virtual_machine

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic_block[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = "latest"
  }

# Custom data for Nginx installation
  custom_data = base64encode(<<EOT
#!/bin/bash
# Update and install Nginx
sudo apt-get update -y
sudo apt-get install -y nginx

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

EOT
  )
}


