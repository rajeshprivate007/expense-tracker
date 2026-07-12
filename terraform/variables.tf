variable "resource_group_name" {
  description = "Name of the Resource group"
  type = string
}

variable "location" {
  description = "Resource group location"
  type = string
  default = "East US"
}

variable "common_tags" {
  description = "Common tags applied to all Azure resources"
  type = map(string)
  default = {
    "Owner" = "rajesh.sahu.private@gmail.com"
    "Environment" = "dev"
  }
}