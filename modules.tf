module "aks" {
  source = "git::git@github.com:raykao/az-tf-modules.git//aks"

  cluster_name            = "${local.prefix}-privaks001"
  resource_group_name     = "${local.prefix}-privaks001"
  location                = azurerm_virtual_network.hub.location
  subnet_id               = azurerm_subnet.aksPrivCluster.id
  load_balancer_subnet_id = azurerm_subnet.loadBalancers.id
  service_cidr            = "10.255.0.0/16"
}

module "jumpbox001" {
  source = "git::git@github.com:raykao/az-tf-modules.git//jumpbox"

  server_name               = "${local.prefix}-jumpbox001"
  resource_group_name       = "${local.prefix}-jumpbox001"
  location                  = azurerm_virtual_network.hub.location
  subnet_id                 = azurerm_subnet.default.id
  public_ip_prefix_id       = azurerm_public_ip_prefix.hub.id
}

// module "consul" {
//   source = "./consul"

//   resource_group_name = "${local.prefix}-consulmasters"
//   location            = azurerm_virtual_network.hub.location
//   subnet_id           = azurerm_subnet.consulVaultMasters.id
//   vmss_name           = "${local.prefix}-consulMasters"
// }

module "aksPub" {
  source = "git::git@github.com:raykao/az-tf-modules.git//aks"

  cluster_name            = "${local.prefix}-pubaks"
  resource_group_name     = "${local.prefix}-pubaks"
  location                = azurerm_virtual_network.hub.location
  private_cluster         = false
  subnet_id               = azurerm_subnet.aksPubCluster.id
  load_balancer_subnet_id = azurerm_subnet.loadBalancers.id
  service_cidr            = "10.254.0.0/16"
}