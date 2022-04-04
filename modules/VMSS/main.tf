# *******************scale set virtual machine configuration*************
resource "azurerm_linux_virtual_machine_scale_set" "scale_set" {
  name                            = "scale-set-${lower(terraform.workspace)}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.sku
  instances                       = var.num_of_instances
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  upgrade_mode                    = "Automatic"
  disable_password_authentication = false


  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "scaleset-interface"
    primary = true

    ip_configuration {
      name                                   = "internal"
      primary                                = true
      subnet_id                              = var.public_subnet_id
      load_balancer_backend_address_pool_ids = [var.LB_backend_add_pool_id]

    }
  }
  depends_on = [
    var.virtual_network_name
  ]
  lifecycle {
    ignore_changes = [instances]
  }
}
# ****************************************************************

