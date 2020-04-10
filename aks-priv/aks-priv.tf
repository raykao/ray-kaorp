resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = var.cluster_name

  service_principal {
    client_id     = azuread_application.aks.application_id
    client_secret = random_password.aks-sp-secret.result
  }

  private_link_enabled = var.private_cluster

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = var.vm_size
    type       = "VirtualMachineScaleSets"
    vnet_subnet_id = var.subnet_id
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    dns_service_ip = cidrhost(var.service_cidr, 10)
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr

    load_balancer_sku  = "Standard"
  }

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count,
      default_node_pool[0].vnet_subnet_id,
      windows_profile
    ]
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "secondary_pool" {
  name                  = "second"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  lifecycle {
    ignore_changes = [
      kubernetes_cluster_id,
      vnet_subnet_id,
      node_count
    ]
  }
}