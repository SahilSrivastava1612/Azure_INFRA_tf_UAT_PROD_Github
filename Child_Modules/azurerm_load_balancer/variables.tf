variable "load_balancer_name" {
  description = "Name of the Azure Load Balancer"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the existing Public IP to associate with the Load Balancer"
  type        = string
}

variable "backend_pool_name" {
  description = "Name of the backend address pool"
  type        = string
}

variable "lb_health_probe_name" {
  description = "Name of the Load Balancer health probe"
  type        = string
}

variable "lb_health_probe_port" {
  description = "Port number for the Load Balancer health probe"
  type        = number
}

variable "nic_name" {
  description = "Name of the first Network Interface to associate with the Load Balancer backend pool"
  type        = string
  
}

variable "nic_name2" {
  description = "Name of the second Network Interface to associate with the Load Balancer backend pool"
  type        = string  
  
}