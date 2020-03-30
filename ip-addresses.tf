resource "azurerm_public_ip_prefix" "hub" {
  name                = "testpipprefix"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  sku                 = "Standard"
  prefix_length       = var.public_ip_prefix
}

resource "azurerm_public_ip" "azureFirewall" {
  name                = "testpip"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  allocation_method   = "Static"
  sku                 = "Standard"
  public_ip_prefix_id = azurerm_public_ip_prefix.hub.id
}

resource "azurerm_public_ip" "jumpbox" {
  name                = "pip-jumpbox"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  allocation_method   = "Static"
  sku                 = "Standard"
  public_ip_prefix_id = azurerm_public_ip_prefix.hub.id
  domain_name_label   = "rkjumpbox001"
}