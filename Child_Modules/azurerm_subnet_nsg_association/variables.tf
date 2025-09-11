variable "nsg_block_name" {
  description = "The name of the Network Security Group to be created."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Group."
  type        = string  
  
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network containing the Subnet."
  type        = string
  
}

variable "subnet_name" {
  description = "The name of the Subnet to associate with the Network Security Group."
  type        = string
  
}

