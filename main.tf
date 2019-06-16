// EXTENSION DOES NOT SUPPORT HCL2/TF 0.12
// using less popular extension (vscode-terraform0.12)

provider "azurerm" {
    subscription_id = var.sub-id // optional config of which subscription I want to talk to
}

// resource group for all resources
resource "azurerm_resource_group" "rg" { // azurerm_resource_group is the "type", "hello-world" is the name I use to reference things
    name = var.resource_group
    location = var.location
}

module "network" {
    source = "./modules/network" // I guess this means "run main.tf of ../modules/network"
    rg = var.resource_group
}

resource "azurerm_resource_group" "storage" { // "<PROVIDER>" "<NAME OF OBJECT>"
    name = var.resource_group
    location = var.location
}

module "storage" {
    source = "./modules/storage"
    rg = var.resource_group
    location = var.location
}
