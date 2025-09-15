variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string  
  
}

variable "nic" {
  
}

variable "virtual_machines" {}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string  
  
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string  
  
}

variable "rg_name" {
  description = "The name of the resource group in which to create the virtual machine."
  type        = string
}
  
variable "virtual_machine" {
  
}

variable "key_vault_rg" {
  description = "The resource group name where the Key Vault is located."
  type        = string
  
}



