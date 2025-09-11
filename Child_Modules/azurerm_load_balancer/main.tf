resource "azurerm_lb" "load_balancer_block" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.data_public_ip_block.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend_pool_block" {
  loadbalancer_id = azurerm_lb.load_balancer_block.id
  name            = var.backend_pool_name
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_association_block" {
  network_interface_id    = data.azurerm_network_interface.data_nic_block.id
  ip_configuration_name   = data.azurerm_network_interface.data_nic_block.ip_configuration[0].name  # Need to use this [0] as Ip configuration is a list value
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool_block.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_lb_association_block2" {
  network_interface_id    = data.azurerm_network_interface.data_nic_block2.id
  ip_configuration_name   = data.azurerm_network_interface.data_nic_block2.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool_block.id
}

resource "azurerm_lb_probe" "lb_health_probe_block" {
  loadbalancer_id = azurerm_lb.load_balancer_block.id
  name            = var.lb_health_probe_name
  protocol        = "Tcp"
  port            = var.lb_health_probe_port
  interval_in_seconds = 15
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.load_balancer_block.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.load_balancer_block.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_pool_block.id]
  probe_id                       = azurerm_lb_probe.lb_health_probe_block.id
}