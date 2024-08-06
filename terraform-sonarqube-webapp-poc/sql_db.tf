resource "azurerm_mssql_server" "sql_server" {
  name                         = "sql-server-${var.project_name}-${var.env}"
  resource_group_name          = azurerm_resource_group.resource_group.name
  location                     = azurerm_resource_group.resource_group.location
  version                      = "12.0"
  administrator_login          = var.sql_server_adm_username
  administrator_login_password = var.sql_server_adm_password
}

resource "azurerm_mssql_database" "sql_database" {
  name           = "sqldb-${var.project_name}-${var.env}"
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = "SQL_Latin1_General_CP1_CS_AS"
  license_type   = "LicenseIncluded"
  sku_name       = "Basic"
  tags = {
    environment : var.env
    application_name = var.project_name
  }
}