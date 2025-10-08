resource "azurerm_network_security_group" "javansg" {
  name                = "${var.application_name}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "${var.application_name}-allow-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.javansg.name
}

resource "azurerm_network_security_rule" "allow_http" {
  name                        = "${var.application_name}-allow-http"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.javansg.name
}

resource "azurerm_network_security_rule" "allow_https" {
  name                        = "${var.application_name}-allow-https"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.javansg.name
}

resource "azurerm_virtual_network" "javavnet" {
  name                = "${var.application_name}-vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.java_cidr
}

resource "azurerm_subnet" "javasubnet" {
  name                 = "${var.application_name}-sub"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.javavnet.name
  address_prefixes     = var.java_sub_cidr
}

resource "azurerm_subnet_network_security_group_association" "java_subnet_nsg" {
  subnet_id                 = azurerm_subnet.javasubnet.id
  network_security_group_id = azurerm_network_security_group.javansg.id
}

resource "azurerm_public_ip" "javapubip" {
  name                = "${var.application_name}-pubip"
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "subnet_id" {
  value = azurerm_subnet.javasubnet.id
}

output "public_ip_id" {
  value = azurerm_public_ip.javapubip.id
}
