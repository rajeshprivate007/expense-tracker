output "name" {
  description = "The name of the Workspace"
  value       = azurerm_log_analytics_workspace.name
  
}

output "id" {
  description = "The ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.id
}

output "location" {
  description = "The location of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.location
}