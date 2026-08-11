output "rg_names" {
  value = { for rg in azurerm_resource_group.rg : rg.name => rg.name }
}
output "rg_location" {
  value = { for rg in azurerm_resource_group.rg : rg.name => rg.location }
}