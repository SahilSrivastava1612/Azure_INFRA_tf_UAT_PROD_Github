variable "location" {
  description = "The Azure location where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create resources."
  type        = string
}

variable "web_apps" {
  description = "A map of web app configurations."
  type = map(object({
    app_name          = string
    location          = string
    resource_group_name = string
    linux_fx_version  = string
  }))
}