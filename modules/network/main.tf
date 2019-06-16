variable "subnets" {
  type="array"
  default = [
    {
      name = "${var.vnet-name}-sub001"
      address_prefix = "10.1.2.0/25"
    },
    {
      name = "${var.vnet-name}-sub001"
      address_prefix = "10.1.3.0/25"
    }
  ]
}



resource "azurerm_virtual_network" "default" {
  name          = var.vnet-name
  resource_group_name = var.rg
  address_space = ["10.1.2.0/24"]
  location      = "West US"

  // convert this to a LIST of subnets  
  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.name
      address_prefix = "10.1.2.0/25"
    }
  }
}

// todo

// create nsg

// assign policy to restrict nsg modifcations

// in a perfect world, would also be able to add a deny assignment...