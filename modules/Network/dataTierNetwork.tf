#*************** Declaring a private subnet and Data Tier NSG ************

#****** Declaring a public subnet************
resource "azurerm_subnet" "private_subnet" {
  name                 = "private-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}
#******************************************************


#***************NSG for the Data Tier*****************
resource "azurerm_network_security_group" "Data-Tier-NSG" {
  name                = "Data-Tier"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [var.resource_group_name, azurerm_subnet.private_subnet]

    security_rule {
    name                       = "port_5432_Allow"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "5432"
    destination_port_range     = "5432"
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "*"
  }
}
#******************************************************

#*************associate between the private subnet & NSG**********
resource "azurerm_subnet_network_security_group_association" "nsg_db_association" {
  subnet_id                 = azurerm_subnet.private_subnet.id
  network_security_group_id = azurerm_network_security_group.Data-Tier-NSG.id
   depends_on = [
    azurerm_network_security_group.Data-Tier-NSG
  ]
}

#******************************************************
