variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region for the resource group"
}

variable "function_app_name" {
  description = "Name of the Azure Function App"
}

variable "sql_server_name" {
  description = "Name of the SQL server"
}

variable "sql_database_name" {
  description = "Name of the SQL database"
}

variable "sql_admin_username" {
  description = "Administrator login for SQL server"
}

variable "sql_admin_password" {
  description = "Administrator password for SQL server"
}
