terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "techchallenge-app" {
  name     = "example-resources"
  location = "Central US"
}

resource "azurerm_container_group" "techchallenge-app" {
  name                = "techchallenge-app"
  location            = azurerm_resource_group.techchallenge-app.location
  resource_group_name = azurerm_resource_group.techchallenge-app.name
  ip_address_type     = "Public"
  dns_name_label      = "aci-label"
  os_type             = "Linux"


  container {
    name   = "servian"
    image  = "servian/techchallengeapp:latest"
    ports {
      port= 3000
      protocol= "TCP"
    }
    cpu= "1.0"
    memory= "1.0"
  }

  tags = {
    environment = "testing"
  }
}
