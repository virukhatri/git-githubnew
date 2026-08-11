resource "azurerm_subnet" "subnet" {
  for_each = {for subnet in var.subnet_data : subnet.subnet_name => subnet}
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = [each.value.address_prefixes]
}