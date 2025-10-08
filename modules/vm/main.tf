resource "azurerm_network_interface" "javanic" {
  name                = "${var.application_name}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.application_name}-nic"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }
}

resource "azurerm_virtual_machine" "javavm" {
  name                  = "${var.application_name}-vm"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.javanic.id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination   = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.application_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.application_name}-vm"
    admin_username = var.vm_username
    admin_password = var.vm_pass
  }

os_profile_linux_config {
  disable_password_authentication = true

  ssh_keys {
   
    key_data = file("${path.root}/publickey.pub")
    path     = "/home/${var.vm_username}/.ssh/authorized_keys"
  }
}



  }
