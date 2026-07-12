variable "name" {
  description = "Resource group name"
  type = string
}

variable "location" {
  description = "Resource group location"
  type = string
}

variable "tags" {
  description = "Resource group Tag"
  type = map(string)
  default = {
    "Owner" = "rajesh.sahu.private@gmail.com"
    "Environment" = "dev"
  }
}