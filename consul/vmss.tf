resource "azurerm_resource_group" "consul" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_linux_virtual_machine_scale_set" "consul" {
  name                = var.vmss_name
  resource_group_name = azurerm_resource_group.consul.name
  location            = azurerm_resource_group.consul.location
  sku                 = var.vm_sku
  instances           = var.instances
  admin_username      = "hashiadmin"

  admin_ssh_key {
    username   = "hashiadmin"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "primary"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}