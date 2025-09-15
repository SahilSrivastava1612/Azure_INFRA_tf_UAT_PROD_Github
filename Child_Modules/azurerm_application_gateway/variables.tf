variable "application_gateway_name" {
  description = "Name of the Application Gateway."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
}

variable "gateway_ip_configuration_name" {
  description = "Name of the gateway IP configuration."
  type        = string
}

variable "frontend_port_name" {
  description = "Name of the frontend port."
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Name of the frontend IP configuration."
  type        = string
}

variable "backend_address_pool_name" {
  description = "Name of the backend address pool."
  type        = string
}

variable "http_setting_name" {
  description = "Name of the backend HTTP settings."
  type        = string
}

variable "listener_name" {
  description = "Name of the HTTP listener."
  type        = string
}

variable "request_routing_rule_name" {
  description = "Name of the request routing rule."
  type        = string
}

variable "application_gateway_capacity" {
  description = "Capacity for the Application Gateway SKU."
  type        = number
  default     = 2
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP address."
  type        = string
}