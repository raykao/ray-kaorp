
resource "azurerm_route_table" "aks" {
  name                          = "RT-Global-AKS"
  location                      = azurerm_resource_group.hub.location
  resource_group_name           = azurerm_resource_group.hub.name
  disable_bgp_route_propagation = false

  route {
    name                      = "default"
    address_prefix            = "0.0.0.0/0"
    next_hop_in_ip_address    = azurerm_firewall.hub.ip_configuration[0].private_ip_address
    next_hop_type             = "VirtualAppliance"
  }

  route {
    name           = "Internet"
    address_prefix = "${azurerm_public_ip.azureFirewall.ip_address}/${var.public_ip_prefix}"
    next_hop_type  = "Internet"
  }
}

resource "azurerm_subnet_route_table_association" "aks" {
  subnet_id      = azurerm_subnet.aksPrivCluster.id
  route_table_id = azurerm_route_table.aks.id
}