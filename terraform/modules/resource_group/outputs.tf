output "name" {
    description = "The name of the resource group"
    value = azurerm_resource_group.rg.name
}

output "id" {
  description = "Resource group ID"
  value = azurerm_resource_group.rg.id
}

output "location" {
  description = "Resource group location"
  value = azurerm_resource_group.rg.location
}