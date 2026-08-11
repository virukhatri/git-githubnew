locals {
    rg_data = csvdecode(file("${path.module}/../data/resource_group.csv"))
    vnet_data = csvdecode(file("${path.module}/../data/vnet.csv"))
    subnet_data = csvdecode(file("${path.module}/../data/subnet.csv"))
    security_group_data = csvdecode(file("${path.module}/../data/security_group.csv"))
    security_rule_data = csvdecode(file("${path.module}/../data/security_group_rules.csv"))
    nic_data = csvdecode(file("${path.module}/../data/nic.csv"))
    public_ip_data = csvdecode(file("${path.module}/../data/public_ip.csv"))
    subnet_nsg_pairs = {
    for key, subnet_id in module.subnet.subnet_ids : key => {
      subnet_id = subnet_id
      nsg_id    = module.network_security_group.sg_ids[key]
    }
    # Optional guard to ensure the NSG key actually exists
    if contains(keys(module.network_security_group.sg_ids), key)
  }
  vm_data = csvdecode(file("${path.module}/../data/vm.csv"))
}
