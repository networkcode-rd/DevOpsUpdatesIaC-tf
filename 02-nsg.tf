# First two block of NSG and its association

resource "azurerm_network_security_group" "nsg_server_subnet" {
  name                = "${var.env-1}-srv-sub-nsg-tf"
  location            = azurerm_resource_group.rg_reference.location
  resource_group_name = azurerm_resource_group.rg_reference.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association_sub" {
  subnet_id                 = azurerm_subnet.server_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_server_subnet.id
}


# Second two block of NSG and its association

resource "azurerm_network_security_group" "nsg_server_alt_subnet" {
  name                = "${var.env-1}-srv-sub-alt-nsg-tf"
  location            = azurerm_resource_group.rg_reference.location
  resource_group_name = azurerm_resource_group.rg_reference.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association_alt_sub" {
  subnet_id                 = azurerm_subnet.server_alternate_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg_server_alt_subnet.id
}