resource "azurerm_public_ip" "jumpbox" {
  name                = "pip-${var.jumpbox_name}"
  resource_group_name = azurerm_resource_group.jumpbox.name
  location            = azurerm_resource_group.jumpbox.location
  allocation_method   = "Static"
  sku                 = "Standard"
  public_ip_prefix_id = var.public_ip_prefix_id
  domain_name_label   = var.jumpbox_name
}
