resource "azurerm_virtual_network" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.edge[each.value.region].name

  tags = {
    type        = "Edge"
    description = "Virtual Network"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    wave        = each.value.wave
  }
}
