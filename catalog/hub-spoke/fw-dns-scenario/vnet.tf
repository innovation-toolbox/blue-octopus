resource "azurerm_virtual_network" "hub" {
  name                = format("vnet-hub-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_hub_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_virtual_network" "dns" {
  name                = format("vnet-dns-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_dns_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags
}


resource "azurerm_virtual_network" "spk1" {
  name                = format("vnet-spk1-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_spk1_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  dns_servers = [
    azurerm_firewall.this.ip_configuration[0].private_ip_address
  ]
}

resource "azurerm_virtual_network" "spk2" {
  name                = format("vnet-spk2-%s", local.resource_suffix_kebabcase)
  address_space       = [format("%s%s", var.vnet_spk2_address_prefix, var.vnet_address_suffix)]
  location            = local.resource_group_location
  resource_group_name = local.resource_group_name
  tags                = local.tags

  dns_servers = [
    azurerm_firewall.this.ip_configuration[0].private_ip_address
  ]
}

resource "azurerm_virtual_network" "spk3" {
  name                = format("vnet-spk3-%s", local.resource_suffix_kebabcase_spk3)
  address_space       = [format("%s%s", var.vnet_spk3_address_prefix, var.vnet_address_suffix)]
  location            = var.location_spk3
  resource_group_name = local.resource_group_name
  tags                = local.tags

  dns_servers = [
    azurerm_firewall.this.ip_configuration[0].private_ip_address
  ]
}