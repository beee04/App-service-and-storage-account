resource "azurerm_virtual_network" "this" {
  name                = var.name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "name" {
  value = azurerm_virtual_network.this.name
}
