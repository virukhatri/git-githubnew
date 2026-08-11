output "public_ip_address"{
  value = {for k, pip in azurerm_public_ip.pb_ip : k => pip.ip_address}
}