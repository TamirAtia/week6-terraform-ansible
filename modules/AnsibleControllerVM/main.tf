
resource "azurerm_linux_virtual_machine" "ansible" {
  name                  = "${terraform.workspace}-ansibleVM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.ansible_nic_id]
  size                  = "Standard_B1ls"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  disable_password_authentication = false

  custom_data = base64encode(templatefile("ansiBash.tftpl",local.vars))

  os_disk {
    caching       = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}