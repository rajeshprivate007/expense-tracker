# Terraform configuration for Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = var.aks_subnet_name
    address_prefixes = var.subnet_cidr
  }

  tags = var.common_tags
}
