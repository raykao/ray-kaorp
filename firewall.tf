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

resource "azurerm_firewall_application_rule_collection" "aks" {
  name                = "AKS_Global_Required"
  azure_firewall_name = azurerm_firewall.hub.name
  resource_group_name = azurerm_resource_group.hub.name
  priority            = 100
  action              = "Allow"

  rule {
    name = "testrule"

    source_addresses = [
      "*",
    ]

    target_fqdns = [
        "aksrepos.azurecr.io",
        "*blob.core.windows.net",
        "mcr.microsoft.com",
        "*cdn.mscr.io",
        "*.data.mcr.microsoft.com",
        "management.azure.com",
        "login.microsoftonline.com",
        "ntp.ubuntu.com",
        "packages.microsoft.com",
        "acs-mirror.azureedge.net"
    ]

    protocol {
      port = "443"
      type = "Https"
    }
    protocol {
      port = "80"
      type = "Http"
    }
  }
}
