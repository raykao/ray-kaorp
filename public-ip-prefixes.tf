resource "azurerm_public_ip_prefix" "hub" {
  name                = "${local.prefix}-pip-prefix"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  sku                 = "Standard"
  prefix_length       = var.public_ip_prefix
}