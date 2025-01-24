variable "sql_server_name" {
  description = "Name of the SQL server"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region for the resource group"
}

variable "administrator_login" {
  description = "Administrator login for SQL server"
}

variable "administrator_password" {
  description = "Administrator password for SQL server"
}

variable "database_name" {
  description = "Name of the SQL database"
}
