resource "azurerm_service_plan" "service_plan" {
  name                = "sp-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = "Linux"        
  sku_name            = "B1"
     
  tags = {
    environment : var.env
    application_name = var.project_name
  }

}