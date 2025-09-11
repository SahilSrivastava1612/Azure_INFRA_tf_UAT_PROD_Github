variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "The Azure location where the AKS cluster will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix to use with the AKS cluster."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "acr_resource_group_name" {
  description = "The resource group name of the Azure Container Registry."
  type        = string  
  
}