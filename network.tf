resource "azurerm_virtual_network" "hub" {
  name                = "${local.prefix}-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
}

resource "azurerm_subnet" "azureFirewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.0/26"
}

resource "azurerm_subnet" "loadBalancers" {
  name                 = "loadBalancers"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.64/26"
}

resource "azurerm_subnet" "consulVaultMasters" {
  name                 = "consulVaultMasters"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.0.128/28"
}

resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "aksPrivCluster" {
  name                  = "aksPriv"
  resource_group_name   = azurerm_resource_group.hub.name
  virtual_network_name  = azurerm_virtual_network.hub.name
  address_prefix        = "10.0.2.0/24"
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true
}

resource "azurerm_subnet" "aksPubCluster" {
  name                  = "aksPub"
  resource_group_name   = azurerm_resource_group.hub.name
  virtual_network_name  = azurerm_virtual_network.hub.name
  address_prefix        = "10.0.3.0/24"
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies = true
}