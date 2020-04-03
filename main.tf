terraform {
  required_version = "~> 0.12.23"
}

provider "azurerm" {
  version = "=2.0.0"
  features {}
}

locals {
  prefix    = "${terraform.workspace}-${var.prefix}"
  location  = var.location
}