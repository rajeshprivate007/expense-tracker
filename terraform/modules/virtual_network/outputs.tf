output "name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
  
}

output "aks_subnet_id" {
  description = "The ID of the AKS subnet"
  value       = azurerm_subnet.aks.id
}

output "location" {
  description = "The location of virtual network"
  value       = azurerm_virtual_network.vnet.location
}