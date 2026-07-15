resource_group_name = "rg_expense_tracker_dev"
location = "East US"

common_tags = {
  "Owner" = "rajesh.sahu.private@gmail.com"
  "Environment" = "dev"
}

# =========== Values for Virtual Network ==============
vnet_name = "vnet_expense_tracker_dev"
vnet_address_space = ["10.0.0.0/16"]
aks_subnet_name = "subnet_aks_dev"
subnet_cidr = ["10.0.1.0/24"]

# =========== Values for Log Analytics Workspace ==============
workspace_name = "log-analytics-dev"
workspace_sku = "PerGB2018"
workspace_retention_in_days = 30


# =========== Values for AKS Cluster ==============
aks_cluster_name = "aks-dev"
kubernetes_version = "1.34.6"
dns_prefix = "dev-aks-dns"
aks_sku_tier = "Standard"
private_cluster_enabled = false
local_account_disabled = true
azure_rbac_enabled = true
admin_group_object_ids = []
network_plugin = "azure"
network_policy = "azure"
outbound_type = "loadBalancer"
service_cidr = "10.100.0.0/16"
dns_service_ip = "10.100.0.10"
docker_bridge_cidr = "127.17.0.1/16"
api_server_authorized_ip_ranges = []
workload_identity_enabled = true
oidc_issuer_enabled = true
azure_policy_enabled = true

default_node_pool = {
    name                 = "system"
    vm_size              = "Standard_D4s_v5"
    zones                = ["1", "2", "3"]
    enable_auto_scaling  = true
    min_count            = 1
    max_count            = 3
    max_pods             = 30
    os_disk_size_gb      = 128
    os_disk_type         = "Managed"
    only_critical_addons = false
}

node_pools = {
  apps = {
      name                 = "apps"
      vm_size              = "Standard_D4s_v5"
      mode                 = "User"
      zones                = ["1", "2", "3"]
      os_type              = "Linux"
      os_sku               = "Ubuntu"
      max_pods             = 30
      enable_auto_scaling  = true
      min_count            = 1
      max_count            = 5
      node_labels = {
        workload = "apps"
      }
      node_taints = []
      tags        = {}
    }
}

namespaces = {
  apps = {
    name        = "dev-apps"
    labels      = {
      "workload" = "apps"
    }
    annotations = {}
  }

  ingress = {
      labels = {
        istio_injection = "disabled"
      }
      annotations = {}
    }
}