resource "azurerm_container_registry" "acr" {
  name                = "ggstream"
  resource_group_name = azurerm_resource_group.docker.name
  location            = azurerm_resource_group.docker.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = {
    type        = "infra"
    description = "Container Registry"
    region      = "na"
    wave        = 0
  }
}
