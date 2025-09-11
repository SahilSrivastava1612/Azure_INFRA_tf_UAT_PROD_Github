variable "bastion_name" {
  description = "The name of the Bastion Host."
  type        = string
}

variable "location" {
  description = "The Azure location where the Bastion Host will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Bastion Host."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet for the Bastion Host."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network containing the subnet."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address for the Bastion Host."
  type        = string
}