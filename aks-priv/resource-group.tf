resource "azurerm_resource_group" "aks" {
  name     = var.cluster_name
  location = var.location
}