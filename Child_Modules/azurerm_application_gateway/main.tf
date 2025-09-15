resource "azurerm_application_gateway" "app_gw_block" {
  name                = var.application_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = data.azurerm_subnet.data_subnet_block.id
  }

  frontend_port {
    name = var.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.data_public_ip_block.id
  }

  backend_address_pool {
    name = var.backend_address_pool_name

  ip_addresses = [
    data.azurerm_network_interface.data_nic1_block.ip_configuration[0].private_ip_address,
    data.azurerm_network_interface.data_nic2_block.ip_configuration[0].private_ip_address,
    ]
  }

  backend_http_settings {
    name                  = var.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.listener_name
    frontend_ip_configuration_name = azurerm_application_gateway.app_gw_block.frontend_ip_configuration[0].name
    frontend_port_name             = var.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    priority                   = 101
    rule_type                  = "Basic"
    http_listener_name         = azurerm_application_gateway.app_gw_block.http_listener[0].name
    backend_address_pool_name  = azurerm_application_gateway.app_gw_block.backend_address_pool[0].name
    backend_http_settings_name = azurerm_application_gateway.app_gw_block.backend_http_settings[0].name
  }
}