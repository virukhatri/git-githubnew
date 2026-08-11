resource "azurerm_resource_group" "rg" {
    # {for rg in var.rg_data : rg.name => rg}
  for_each = {for rg in var.rg_data : rg.name => rg}
  name     = each.value.name 
  location = each.value.location
}