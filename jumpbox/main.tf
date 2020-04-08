terraform {
  required_version = "~> 0.12.23"
}

resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "random_pet" "username" {
  length = 1
}

resource "random_pet" "servername" {
  length = 1
}

locals {
  resource_group_name = var.resource_group_name != "" ? var.resource_group_name : "${terraform.workspace}-${random_pet.servername.id}-jbox"
  server_name = var.server_name != "" ? var.server_name : "${terraform.workspace}-${random_pet.servername.id}-jbox"
  username    = var.admin_username != "" ? var.admin_username : random_pet.username.id
  password    = var.admin_password != "" ? var.admin_password : random_password.password.result
}