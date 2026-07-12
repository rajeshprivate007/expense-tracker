module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group.rg.name
  location = var.resource_group.rg.location
  tags     = var.resource_group.rg.tags
  
}