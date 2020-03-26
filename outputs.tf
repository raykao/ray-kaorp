output "hubNetworkId" {
  value = azurerm_virtual_network.hub.id
}

output "defaultSubnet" {
  value = azurerm_subnet.default.id
}

output "consulMasterSubnet" {
  value = azurerm_subnet.consulMasters.id
}

output "azureFirewallSubnet" {
  value = azurerm_subnet.azureFirewall.id
}