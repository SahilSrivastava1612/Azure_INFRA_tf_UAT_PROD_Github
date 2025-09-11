# Service Plan (shared by multiple web apps)
resource "azurerm_service_plan" "appservice_plan" {
  name                = "my-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "F1"   # Pricing tier (F1 = Free, B1 = Basic, S1 = Standard, P1v2 = Premium)
}

# Linux Web Apps (for_each loop)
resource "azurerm_linux_web_app" "web_apps" {
  for_each            = var.web_apps

  name                = each.value.app_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  service_plan_id     = azurerm_service_plan.appservice_plan.id   # <-- Link to service plan

  site_config {
    linux_fx_version = each.value.linux_fx_version
  }

  identity {
    type = "SystemAssigned"
  }
}