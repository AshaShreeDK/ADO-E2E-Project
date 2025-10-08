variable "application_name" {
  type        = string
  description = "Base name for all VM-related resources."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "rg_name" {
  type        = string
  description = "Resource group name."
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for VM NIC."
}

variable "public_ip_id" {
  type        = string
  description = "Public IP resource ID for VM NIC."
}

variable "vm_size" {
  type        = string
  description = "VM size (e.g., Standard_B1ls, Standard_B2s)."
}

variable "vm_username" {
  type        = string
  description = "VM admin username."
}

variable "vm_pass" {
  type        = string
  description = "VM admin password (not used if SSH is enforced)."
  sensitive   = true
}
variable "ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key file"
}
