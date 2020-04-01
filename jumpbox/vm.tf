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
  name                  = var.jumpbox_name
  resource_group_name   = azurerm_resource_group.jumpbox.name
  location              = azurerm_resource_group.jumpbox.location  
  network_interface_ids = [azurerm_network_interface.jumpbox.id]
  vm_size               = "Standard_DS2_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.jumpbox_name
    admin_username = var.admin_username
    admin_password = local.password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}