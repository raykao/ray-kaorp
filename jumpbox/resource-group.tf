resource "azurerm_resource_group" "jumpbox" {
  name        = local.resource_group_name
  location    = var.location
}