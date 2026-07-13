output "name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
  
}

output "id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "location" {
  description = "The location of virtual network"
  value       = azurerm_virtual_network.vnet.location
}