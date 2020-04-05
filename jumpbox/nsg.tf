resource "azurerm_network_security_group" "jumpbox" {
  name                = "${var.server_name}-nsg"
  resource_group_name = azurerm_resource_group.jumpbox.name
  location            = azurerm_resource_group.jumpbox.location
}

resource "azurerm_network_security_rule" "jumpbox" {
  name                        = "SSH"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name = azurerm_resource_group.jumpbox.name
  network_security_group_name = azurerm_network_security_group.jumpbox.name
}