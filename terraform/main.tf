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

# Terraform configuration for Log Analytics Workspace
module "log_analytics" {
  source                      = "./modules/log_analytics"

  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  workspace_name              = var.workspace_name
  workspace_sku               = var.workspace_sku
  workspace_retention_in_days = var.workspace_retention_in_days
  common_tags                 = var.common_tags
}

# Terraform configuration for AKS Cluster
module "aks" {
  source = "./modules/aks_cluster"

  aks_cluster_name       = var.aks_cluster_name
  resource_group_name    = module.resource_group.name
  location               = module.resource_group.location
  kubernetes_version     = var.kubernetes_version
  dns_prefix              = var.dns_prefix
  aks_sku_tier               = var.aks_sku_tier
  private_cluster_enabled = var.private_cluster_enabled
  local_account_disabled = var.local_account_disabled
  azure_rbac_enabled = var.azure_rbac_enabled
  admin_group_object_ids = var.admin_group_object_ids
  network_plugin = var.network_plugin
  network_policy = var.network_policy
  outbound_type = var.outbound_type
  service_cidr = var.service_cidr
  dns_service_ip = var.dns_service_ip
  docker_bridge_cidr = var.docker_bridge_cidr
  default_node_pool = var.default_node_pool
  node_pools = var.node_pools
  aks_subnet_id = module.virtual_network.aks_subnet_id
  log_analytics_workspace_id = module.log_analytics.id
  workload_identity_enabled = var.workload_identity_enabled
  oidc_issuer_enabled = var.oidc_issuer_enabled
  azure_policy_enabled = var.azure_policy_enabled
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  common_tags = var.common_tags
}