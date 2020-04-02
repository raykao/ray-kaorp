output "fqdn" {
  value = azurerm_public_ip.jumpbox.fqdn
}

output "username" {
  value = local.username
}

output "password" {
  value = local.password
}