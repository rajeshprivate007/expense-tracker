# Terraform configuration for Azure Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.common_tags
}

# Terraform configuration for Virtual Network
module "virtual_network" {
  source               = "./modules/virtual_network"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  vnet_name            = var.vnet_name
  vnet_address_space   = var.vnet_address_space
  aks_subnet_name      = var.aks_subnet_name
  subnet_cidr          = var.subnet_cidr
  common_tags          = var.common_tags
}
