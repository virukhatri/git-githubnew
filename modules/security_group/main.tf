resource "azurerm_network_security_group" "nsg" {
  for_each = {for sg in var.security_group_data : sg.name => sg}
  name     = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name  
}