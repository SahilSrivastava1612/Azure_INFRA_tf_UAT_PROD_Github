variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Server."
  type        = string
}

variable "location" {
  description = "The Azure location where the SQL Server will be created."
  type        = string
}

variable "sql_server_version" {
  description = "The version of the SQL Server."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  
}

variable "key_vault_rg" {
  
}