variable "rg" {
    type = "string"
}

variable "location" {
    type = "string"
}

resource "random_integer" "storage-suffix" {
    min = 10000
    max = 99999
} 

locals {
    storage-name = "diag${random_integer.storage-suffix.id}"
}

resource "azurerm_storage_account" "diagnostics" {
    name = local.storage-name
    resource_group_name = var.rg
    location = var.location
    account_tier = "Standard"
    account_replication_type = "GRS"
}