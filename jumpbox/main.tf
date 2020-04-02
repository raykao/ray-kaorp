resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%@"
}

resource "random_pet" "username" {
  length = 1
}

locals {
  username = var.admin_username != "" ? var.admin_username : random_pet.username.id
  password = var.admin_password != "" ? var.admin_password : random_password.password.result
}