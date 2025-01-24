terraform {
  backend "azurerm" {
    resource_group_name   = "Strorage-RG"
    storage_account_name  = "storageaccount308081"
    container_name        = "marketing"
    key                   = "function.tfstate"

    client_id             = "b049e7c4-b809-486b-9433-8a6745db6a95"
    client_secret         = "4eR8Q~IEcr33IpppLTQ_ay2UiPqe_sxg35rUJapg"
    tenant_id             = "3c33924a-8f7e-460b-96e0-58bc5724686f"
    subscription_id       = "a62b8882-3f1a-45ff-852f-3d4d1fe3ee13"
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "function_app" {
  source              = "./modules/function_app"
  function_app_name   = var.function_app_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
# app_service_plan_id        = azurerm_app_service_plan.this.id
 # storage_account_name       = azurerm_storage_account.this.name
}

module "sql_server" {
  source                  = "./modules/sql_server"
  sql_server_name         = var.sql_server_name
  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  administrator_login     = var.sql_admin_username
  administrator_password  = var.sql_admin_password
  database_name           = var.sql_database_name
}

resource "azurerm_role_assignment" "function_app_sql_access" {
  principal_id           = module.function_app.function_app_identity
  role_definition_name   = "Contributor"
  scope                  = module.sql_server.sql_database_id
}
