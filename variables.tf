variable "application_name" {
  type        = string
  description = "Base name for all resources."
}

variable "location" {
  type        = string
  description = "Azure region (e.g., australiaeast)."
}

variable "java_cidr" {
  type        = list(string)
  description = "VNet address space."
}

variable "java_sub_cidr" {
  type        = list(string)
  description = "Subnet address space."
}

variable "vm_size" {
  type        = string
  description = "Azure VM size."
}

variable "vm_username" {
  type        = string
  description = "VM admin username."
}

variable "vm_pass" {
  type        = string
  description = "VM admin password."
  sensitive   = true
}


