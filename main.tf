// EXTENSION DOES NOT SUPPORT HCL2/TF 0.12
// using less popular extension (vscode-terraform0.12)

provider "azurerm" {
    subscription_id = var.sub-id // optional config of which subscription I want to talk to
}

resource "azurerm_resource_group" "hello-world" { // azurerm_resource_group is the "type", "hello-world" is the name I use to reference things
    name = var.resource_group
    location = var.location
}

module "hello-world" {
    source = "./modules/network" // I guess this means "run main.tf of ../helloworld?"
    rg = var.resource_group

    /*
    resource_group = "hello-world-module"
    dns-prefix = "hello-world-module"
    container-name = "my-aci-3"
    */
}


/*
resource "azurerm_resource_group" "hello-world" { // azurerm_resource_group is the "type", "hello-world" is the name I use to reference things
    name = var.resource_group
    location = var.location
}

// when i switched subscriptions, the ri stayed the same..
resource "random_integer" "ri" { // does this random integer get saved in the state file so I am still idempotent?
    min = 10000
    max = 99999
}

resource "azurerm_container_group" "my-aci" {
    name = var.container-name
    location = azurerm_resource_group.hello-world.location
    resource_group_name = azurerm_resource_group.hello-world.name
    ip_address_type     = "public"
    dns_name_label      = "${var.dns-prefix}-${random_integer.ri.result}" // EASY string concatenation
    os_type             = "linux"

    container {
        name   = "hello-world"
        image  = var.container-image
        cpu    = "0.5"
        memory = "1.5"
        ports {
            port     = 80
            protocol = "TCP"
        }
    }
}
*/