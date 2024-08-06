resource "azurerm_linux_web_app" "app_service" {
  name                = "app-${var.project_name}-${var.env}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {
    always_on = true
    application_stack {
      docker_image_name   = "sonarqube:lts"
      docker_registry_url = "https://index.docker.io"
    }
  }
  identity {
    type = "SystemAssigned"
  }
  tags = {
    environment : var.env
    application_name = var.project_name
  }
}

data "azurerm_container_registry" "acr" {
  name                = "cr-${var.project_name}"
  resource_group_name = "rg-${var.project_name}"
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_linux_web_app.app_service.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = data.azurerm_container_registry.acr.id
}