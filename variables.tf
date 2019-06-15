variable "resource_group" {
  description = "The name of the resource group in which to create the container instance and Cosmos DB instance."
  default     = "hello-world"
}

variable "location" {
  description = "The location for the resource group in which to create the container instance and Cosmos DB instance."
  default     = "eastus"
}

variable "dns-prefix" {
  description = "DNS prefix for the public IP address of the container instance."
  default     = "hello-world"
}

variable "container-image" {
  description = "Container image for the Azure Vote Flask application."
  default     = "microsoft/aci-helloworld"
}

variable "container-name" {
  description = "Container image for the Azure Vote Flask application."
  default     = "my-aci-2"
}

variable "sub-id" {
  description = "id for subscription to target in azure"
  default = "210b13f9-e96d-493c-919e-34e12038a338"
}