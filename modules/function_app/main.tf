resource "azurerm_app_service_plan" "this" {
  name                = "azure-functions-test-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
resource "azurerm_storage_account" "this" {
  name = lower("${var.function_app_name}torage")  # Make sure it's lowercase
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_function_app" "this" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.this.id
  storage_account_name       = azurerm_storage_account.this.name
  storage_account_access_key = azurerm_storage_account.this.primary_access_key
  os_type                    = "linux"
 # runtime                    = "node"
  version                    = "~3"
  identity {
    type = "SystemAssigned"
  }
}
