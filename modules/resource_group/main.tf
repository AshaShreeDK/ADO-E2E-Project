resource "azurerm_resource_group" "javarg" {
  # Resource Group name includes workspace (dev/prod) to avoid collisions
  name     = "${var.application_name}-${terraform.workspace}-rg"
  location = var.location

  tags = {
    application = var.application_name
    environment = terraform.workspace
    managedBy   = "terraform"
  }
}

output "rg_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.javarg.name
}

output "rg_location" {
  description = "The location of the Resource Group"
  value       = azurerm_resource_group.javarg.location
}
