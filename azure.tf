resource "azurerm_resource_group" "techchallenge-app" {
  name     = "example-resources"
  location = "Central US"
}

resource "azurerm_container_group" "techchallenge-app" {
  name                = "techchallenge-app"
  location            = azurerm_resource_group.techchallenge-app.location
  resource_group_name = azurerm_resource_group.techchallenge-app.name
  ip_address_type     = "public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"


  container {
    name   = "servian"
    image  = "servian/techchallengeapp:latest"
    ports: {
      port: 3000
      protocol: "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}
