
resource "azurerm_public_ip" "ansible-IP" {
  name                = "ansiblePublicIP-${terraform.workspace}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "ansible" {
  name                = "ansibleNIC-${terraform.workspace}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ansibleNicConfiguration"
    subnet_id                     = azurerm_subnet.ansible.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ansible-IP.id
  }
}

resource "azurerm_subnet" "ansible" {
  name                 = "ansible-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "ansible-NSG" {
  name                = "ansible-NSG"
  resource_group_name = var.resource_group_name
  location            = var.location
  depends_on          = [var.resource_group_name, azurerm_subnet.ansible]

  security_rule {
    name                       = "Port_SSH_Allow_My_IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.myIP_Address
    destination_address_prefix = "*"
  }
    
  security_rule {
    name                       = "blockAll"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "ansible-association" {
  subnet_id                 = azurerm_subnet.ansible.id
  network_security_group_id = azurerm_network_security_group.ansible-NSG.id
}
