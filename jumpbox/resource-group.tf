resource "azurerm_resource_group" "jumpbox" {
  name        = var.resource_group_name
  location    = var.location
}