resource "azurerm_firewall" "hub" {
  name                = "primaryFirewall"
  location            = azurerm_resource_group.hub.location
  resource_group_name = azurerm_resource_group.hub.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.azureFirewall.id
    public_ip_address_id = azurerm_public_ip.azureFirewall.id
  }
}

// resource "azurerm_firewall_application_rule_collection" "example" {
//   name                = "testcollection"
//   azure_firewall_name = azurerm_firewall.example.name
//   resource_group_name = azurerm_resource_group.example.name
//   priority            = 100
//   action              = "Allow"

//   rule {
//     name = "testrule"

//     source_addresses = [
//       "10.0.0.0/16",
//     ]

//     target_fqdns = [
//       "*.google.com",
//     ]

//     protocol {
//       port = "443"
//       type = "Https"
//     }
//   }
// }
