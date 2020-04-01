resource "random_password" "password" {
  length = 16
  special = true
  override_special = "_%@"
}

locals {
  password = var.admin_password != "" ? var.admin_password : random_password.password.result
}