output "hubNetworkId" {
  value = azurerm_virtual_network.hub.id
}

output "defaultSubnet" {
  value = azurerm_subnet.default.id
}

output "consulVaultMastersSubnet" {
  value = azurerm_subnet.consulVaultMasters.id
}

output "azureFirewallSubnet" {
  value = azurerm_subnet.azureFirewall.id
}

// IP Addresses

output "azureFirewallPublicIP" {
  value = azurerm_public_ip.azureFirewall.ip_address
}

output "publicPrefixId" {
  value = azurerm_public_ip_prefix.hub.id
}

// Modules

// Jumpbox

output "jumpbox-fqdn" {
  value = module.jumpbox001.fqdn
}

output "jumpbox-username" {
  value = module.jumpbox001.username
}

output "jumpbox-password" {
  value = module.jumpbox001.password
}
