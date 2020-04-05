resource "azurerm_network_interface" "jumpbox" {
  name                = "raykao-nic"
  resource_group_name = azurerm_resource_group.jumpbox.name
  location            = azurerm_resource_group.jumpbox.location  

  ip_configuration {
    name                          = "primaryconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumpbox.id
  }
}

resource "azurerm_network_interface_security_group_association" "jumpbox" {
  network_interface_id      = azurerm_network_interface.jumpbox.id
  network_security_group_id = azurerm_network_security_group.jumpbox.id
}

resource "azurerm_virtual_machine" "jumpbox" {
  name                  = local.server_name
  resource_group_name   = azurerm_resource_group.jumpbox.name
  location              = azurerm_resource_group.jumpbox.location  
  vm_size               = var.vm_size

  network_interface_ids = [azurerm_network_interface.jumpbox.id]
  
  depends_on = [
    azurerm_network_interface.jumpbox
  ]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = local.server_name
    admin_username = local.username
  }
  os_profile_linux_config {
    disable_password_authentication = true
    
    ssh_keys {
      key_data  = file("~/.ssh/id_rsa.pub")
      path      = "/home/${local.username}/.ssh/authorized_keys"
    }
  }
}