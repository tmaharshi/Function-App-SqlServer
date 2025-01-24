output "function_app_name" {
  value = azurerm_function_app.this.name
}
output "function_app_id" {
  value = azurerm_function_app.this.id
}
output "function_app_identity" {
  value = azurerm_function_app.this.identity[0].principal_id
}
output "app_service_plan_id" {
  value = azurerm_app_service_plan.this.id
}

