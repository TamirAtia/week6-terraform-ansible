output "public_subnet_id" {
  value = azurerm_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = azurerm_subnet.private_subnet.id
}

output "vnet-ID" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet-Name" {
  value = azurerm_virtual_network.vnet.name
}

output "ansible_nic_id" {
  value = azurerm_network_interface.ansible.id
}
