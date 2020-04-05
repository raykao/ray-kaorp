resource "azurerm_private_dns_zone" "hub" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.hub.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "hub" {
  name                  = "${local.prefix}-az-dns-priv-link"
  resource_group_name   = azurerm_resource_group.hub.name
  private_dns_zone_name = azurerm_private_dns_zone.hub.name
  virtual_network_id    = azurerm_virtual_network.hub.id
  registration_enabled  = true
}