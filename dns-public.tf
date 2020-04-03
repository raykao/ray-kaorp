resource "azurerm_dns_zone" "primary-public" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.hub.name
}