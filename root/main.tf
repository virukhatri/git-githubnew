module "resource_group" {
  source = "../modules/resource_group"
  rg_data = local.rg_data
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source = "../modules/vnet"
  vnet_data = local.vnet_data
}

module "subnet" {
  depends_on = [module.virtual_network]
  source = "../modules/subnet"
  subnet_data = local.subnet_data
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source = "../modules/security_group"
  security_group_data = local.security_group_data
}

module "network_security_rule" {
  depends_on = [module.network_security_group]
  source = "../modules/security_group_rules"
  security_rule_data = local.security_rule_data
}

module "network_interface" {
  depends_on = [module.subnet]
  source = "../modules/nic"
  nic_data = local.nic_data
  subnet_id = module.subnet.subnet_ids
  public_ip_id = module.public_ip.public_ip_address
}

module "public_ip" {
  depends_on = [module.resource_group]
  source = "../modules/public_ip"
  public_ip_data = local.public_ip_data
}

module "security_group_and_subnet_association" {
  depends_on = [module.subnet, module.network_security_group]
  source = "../modules/security_group_and_subnet_assosiation"
  subnet_nsg_pairs = local.subnet_nsg_pairs
}

module "virtual_machine" {
  depends_on = [module.network_interface]
  source = "../modules/vm"
  vm_data = local.vm_data
  network_interface_ids = module.network_interface.nic_ids
  }