variable "application_name" {
  type        = string
  description = "Base name for all resources."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "rg_name" {
  type        = string
  description = "Resource group name where network resources will be created."
}

variable "java_cidr" {
  type        = list(string)
  description = "VNet address space."
}

variable "java_sub_cidr" {
  type        = list(string)
  description = "Subnet address prefixes."
}
