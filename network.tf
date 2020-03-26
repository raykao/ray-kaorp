resource "azurerm_virtual_network" "hub" {
  name                = "vnet-${local.prefix}"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "azureFirewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.0/26"
}

resource "azurerm_subnet" "loadBalancers" {
  name                 = "LoadBalancers"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.64/26"
}


resource "azurerm_subnet" "consulMasters" {
  name                 = "ConsulMasters"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.128/28"
}


resource "azurerm_subnet" "aksPrivCluster" {
  name                  = "aksPriv"
  resource_group_name   = azurerm_resource_group.hub.name
  virtual_network_name  = azurerm_virtual_network.hub.name
  address_prefix        = "10.0.2.0/24"
}