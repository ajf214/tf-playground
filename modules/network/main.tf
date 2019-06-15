resource "azurerm_virtual_network" "default" {
  name          = var.vnet-name
  resource_group_name = var.rg
  address_space = ["10.1.2.0/24"]
  location      = "West US"

  subnet {
    name           = "${var.vnet-name}-sub001"
    address_prefix = "10.1.2.0/25"
  }
}