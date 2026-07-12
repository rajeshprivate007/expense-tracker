variable "resource_group_name" {
  description = "Name of the Resource group"
  type = string
}

variable "location" {
  description = "Azure location"
  type = string
  default = "East US"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type = string
}

variable "vnet_address_space" {
  description = "Virtual Network Address space"
  type = list(string)
}

variable "aks_subnet_name" {
  description = "Subnet Name"
  type = string
}

variable "subnet_cidr" {
  description = "AKS subnet CIDR"
  type = list(string)
}

variable "common_tags" {
  description = "Common tags applied to all Azure resources"
  type = map(string)
  default = {
    "Owner" = "rajesh.sahu.private@gmail.com"
    "Environment" = "dev"
  }
}