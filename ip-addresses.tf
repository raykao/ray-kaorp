resource "azurerm_public_ip" "azureFirewall" {
  name                = "testpip"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  allocation_method   = "Static"
  sku                 = "Standard"
}