variable "vnet-name" {
  type = "string"
  default = "vnet-001"
}

variable "rg" {
  type = "string"
}

locals {
  subnets = [
    {
      name = "${var.vnet-name}-sub001"
      address_prefix = "10.0.0.0/24"
    },
    {
      name = "${var.vnet-name}-sub002"
      address_prefix = "10.0.1.0/24"
    },
    {
      name = "${var.vnet-name}-sub003",
      address_prefix = "10.0.2.0/24"
    }
  ]
}

resource "azurerm_virtual_network" "default" {
  name          = var.vnet-name
  resource_group_name = var.rg
  address_space = ["10.0.0.0/16"]
  location      = "West US"

  // convert this to a LIST of subnets  
  dynamic "subnet" {
    for_each = local.subnets
    content {
      name           = subnet.value.name // 'subnet' is the default name of the iterator AND the type of nested block that will get created (so multiple subnets) 
      address_prefix = subnet.value.address_prefix
    }
  }
}

// todo

// create nsg

// assign policy to restrict nsg modifcations

// in a perfect world, would also be able to add a deny assignment...