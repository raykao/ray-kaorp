terraform {
  required_version = "~> 0.12.23"
}

# Configure the Microsoft Azure Active Directory Provider
provider "azuread" {
  version = "=0.7.0"
}

resource "random_string" "suffix" {
  length = 4
  special = false
}

resource "random_password" "aks-sp-secret" {
  length = 16
  special = true
  override_special = "-"
}