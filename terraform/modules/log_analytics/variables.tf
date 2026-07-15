variable "resource_group_name" {
  description = "Name of the Resource group"
  type = string
}

variable "location" {
  description = "Azure location"
  type = string
}

variable "workspace_name" {
  description = "Log Analytics workspace Name"
  type = string
}

variable "workspace_sku" {
  description = "Log Analytics workspace SKU"
  type = string
}

variable "workspace_retention_in_days" {
  description = "Retention in days"
  type = number
}

variable "common_tags" {
  description = "Common tags applied to all Azure resources"
  type = map(string)
}