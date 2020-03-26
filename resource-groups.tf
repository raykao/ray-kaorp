resource "azurerm_resource_group" "hub" {
  name        = local.prefix
  location    = local.location
}