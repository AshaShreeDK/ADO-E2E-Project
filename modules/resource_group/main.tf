resource "azurerm_resource_group" "javarg" {
  name     = "${var.application_name}-rg"
  location = var.location
}

output "rg_name" {
  value = azurerm_resource_group.javarg.name
}

output "rg_location" {
  value = azurerm_resource_group.javarg.location
}
