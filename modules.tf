module "aks" {
  source = "./aks-priv"

  cluster_name = "democorpprivaks"
  resource_group_name = "democorpprivaks"
  location     = azurerm_virtual_network.hub.location
  subnet_id    = azurerm_subnet.aksPrivCluster.id
  load_balancer_subnet_id = azurerm_subnet.loadBalancers.id
  service_cidr = "10.255.0.0/16"
}

module "jumpbox001" {
  source = "./jumpbox"

  resource_group_name = "${var.prefix}-jumpbox001"
  location = azurerm_virtual_network.hub.location
  jumpbox_name            = "${var.prefix}-jumpbox001"
  subnet_id               = azurerm_subnet.default.id
  public_ip_prefix_id = azurerm_public_ip_prefix.hub.id
}