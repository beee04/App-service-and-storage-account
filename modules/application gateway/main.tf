resource "azurerm_application_gateway" "application_gateway" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "IPconfiggateway"
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = "frontendIPconfig"
    public_ip_address_id = var.public_ip_id
  }

  backend_address_pool {
    name = "backendpool"
  }

  http_listener {
    name                           = "httplistenser"
    frontend_ip_configuration_id  = azurerm_application_gateway.frontend_ip_configuration[0].id
    frontend_port_configuration_id = azurerm_application_gateway_frontend_port.frontendport.id
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routingrule"
    rule_type                 = "Basic"
    http_listener_id          = azurerm_application_gateway_http_listener.httplistenser.id
    backend_address_pool_id   = azurerm_application_gateway_backend_address_pool.backendpool.id
  }

  web_application_firewall_configuration {
    enabled = true
    firewall_mode = "Detection"
    rule_set_type = "OWASP"
    rule_set_version = "3.2"
  }
}
