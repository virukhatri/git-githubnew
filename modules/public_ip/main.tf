resource "azurerm_public_ip" "pb_ip" {
for_each = {for pip in var.public_ip_data : pip.name => pip}
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}