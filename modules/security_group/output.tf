output "sg_ids" {
  value = {for sg in azurerm_network_security_group.nsg : sg.name => sg.id}
}
