# Create an application
resource "azuread_application" "aks" {
  name = "${var.cluster_name}${random_string.suffix.result}"
}

# Create a service principal
resource "azuread_service_principal" "aks" {
  application_id = azuread_application.aks.application_id
}

resource "azuread_service_principal_password" "aks" {
  service_principal_id = azuread_service_principal.aks.id
  value                = random_password.aks-sp-secret.result
  end_date_relative    = "8760h"
}

resource "azurerm_role_assignment" "loadbalancer-subnet-contributor" {
  scope                = var.load_balancer_subnet_id
  role_definition_name = "contributor"
  principal_id         = azuread_service_principal.aks.object_id
}