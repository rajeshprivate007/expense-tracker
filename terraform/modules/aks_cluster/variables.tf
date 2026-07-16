# =================== AKS cluster variables =====================
variable "resource_group_name" {
  description = "Name of the Resource group"
  type = string
}

variable "location" {
  description = "Azure location"
  type = string
}

variable "aks_cluster_name" {
  description = "AKS cluster Name"
  type = string
}

variable "dns_prefix" {
  description = "AKS DNS Prefix"
  type = string
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
}

variable "aks_sku_tier" {
  description = "AKS SKU tier"
  type        = string

  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.aks_sku_tier)
    error_message = "aks_sku_tier must be one of: Free, Standard, Premium."
  }
}

variable "private_cluster_enabled" {
  description = "Whether the AKS cluster is private"
  type        = bool
}

variable "local_account_disabled" {
  description = "Disable local AKS account"
  type        = bool
}

variable "azure_rbac_enabled" {
  description = "Enable Azure RBAC for Kubernetes authorization"
  type        = bool
}

variable "admin_group_object_ids" {
  description = "AAD group object IDs for AKS cluster admin"
  type        = list(string)
}

variable "network_plugin" {
  description = "AKS network plugin"
  type        = string

  validation {
    condition     = contains(["azure", "kubenet"], var.network_plugin)
    error_message = "network_plugin must be either azure or kubenet"
  }
}

variable "network_policy" {
  description = "AKS network policy"
  type        = string

  validation {
    condition     = contains(["azure", "calico", "cilium"], var.network_policy)
    error_message = "network_policy must be one of: azure, calico, or cilium."
  }
}

variable "outbound_type" {
  description = "AKS outbound traffic mode"
  type        = string

  validation {
    condition = contains([
      "loadBalancer",
      "managedNATGateway",
      "userAssignedNATGateway",
      "userDefinedRouting",
    ], var.outbound_type)
    error_message = "outbound_type must be a valid AKS outbound type"
  }
}

variable "service_cidr" {
  description = "Kubernetes service CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP"
  type        = string
}

variable "docker_bridge_cidr" {
  description = "Docker bridge CIDR"
  type        = string
}

variable "api_server_authorized_ip_ranges" {
  description = "Allowed CIDR for AKS API server when public"
  type        = list(string)
}

variable "workload_identity_enabled" {
  description = "Enable workload identity"
  type        = bool
}

variable "oidc_issuer_enabled" {
  description = "Enable OIDC issuer"
  type        = bool
}

variable "azure_policy_enabled" {
  description = "Enable Azure Policy add-on"
  type        = bool
}

variable "default_node_pool" {
  description = "Default AKS system node pool configuration"
  type = object({
    name                 = string
    vm_size              = string
    zones                = optional(list(string), ["1", "2", "3"])
    enable_auto_scaling  = optional(bool, true)
    node_count           = optional(number, 1)
    min_count            = optional(number, 1)
    max_count            = optional(number, 3)
    max_pods             = optional(number, 30)
    os_disk_size_gb      = optional(number, 128)
    os_disk_type         = optional(string, "Managed")
    only_critical_addons = optional(bool, false)
  })
}

variable "node_pools" {
  description = "Additional AKS user node pools"
  type = map(object({
    name                 = string
    vm_size              = string
    mode                 = optional(string, "User")
    zones                = optional(list(string), ["1", "2", "3"])
    os_type              = optional(string, "Linux")
    os_sku               = optional(string, "Ubuntu")
    max_pods             = optional(number, 30)
    enable_auto_scaling  = optional(bool, true)
    node_count           = optional(number)
    min_count            = optional(number, 1)
    max_count            = optional(number, 5)
    node_labels          = optional(map(string), {})
    node_taints          = optional(list(string), [])
    priority             = optional(string, "Regular")
    eviction_policy      = optional(string)
    spot_max_price       = optional(number)
    orchestrator_version = optional(string)
    subnet_id            = optional(string)
    tags                 = optional(map(string), {})
  }))

  default = {
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
}

variable "namespaces" {
  description = "Kubernetes namespaces to create"
  type = map(object({
    labels      = optional(map(string), {})
    annotations = optional(map(string), {})
  }))

  default = {
    ingress = {
      labels = {
        istio_injection = "disabled"
      }
      annotations = {}
    }
    apps = {
      labels = {
        owner = "platform"
      }
      annotations = {}
    }
  }
}

variable "aks_subnet_id" {
  description = "Subnet ID used by the AKS cluster"
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace attached to the AKS cluster"
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags applied to all Azure resources"
  type               = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace attached to the AKS cluster"
  type        = string
  default     = null
}

variable "common_tags" {
  description = "Common tags applied to all Azure resources"
  type        = map(string)
}