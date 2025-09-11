variable "nsg_block_name" {
  description = "The name of the Network Security Group to be created."
  type        = string
  
}

variable "location" {
  description = "The Azure region where the Network Security Group will be created."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Network Security Group."
  type        = string
  
}
