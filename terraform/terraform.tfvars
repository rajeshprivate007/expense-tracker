resource_group_name = "rg_expense_tracker_dev"
location = "East US"

common_tags = {
  "Owner" = "rajesh.sahu.private@gmail.com"
  "Environment" = "dev"
}

#Values for Virtual Network
vnet_name = "vnet_expense_tracker_dev"
vnet_address_space = ["10.0.0.0/16"]
aks_subnet_name = "subnet_aks_dev"
subnet_cidr = ["10.0.1.0/24"]
