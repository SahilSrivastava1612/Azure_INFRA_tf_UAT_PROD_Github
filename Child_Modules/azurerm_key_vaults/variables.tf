variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure location where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The SKU name to use for this Key Vault (e.g., standard, premium)."
  type        = string
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained while soft deleted."
  type        = number
}

variable "key_permissions" {
  description = "List of key permissions for Key Vault"
  type        = list(string)
  default     = ["Get", "List", "Create", "Delete"]
}

variable "secret_permissions" {
  description = "List of secret permissions for Key Vault"
  type        = list(string)
  default     = ["Get", "List", "Set", "Delete"]
}

variable "certificate_permissions" {
  description = "List of certificate permissions for Key Vault"
  type        = list(string)
  default     = ["Get", "List", "Create", "Delete"]
}

variable "username" {
  description = "Username to be stored in Key Vault"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "Password to be stored in Key Vault"
  type        = string
  sensitive   = true
}