resource "azurerm_virtual_network" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.edge[each.value.region].name

  tags = {
    type        = "edge"
    description = "Virtual Network"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}

resource "azurerm_virtual_network" "origin" {
  for_each = module.configs.originNodes

  name                = "ggstream-origin-${each.value.location}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.origin[each.value.region].name

  tags = {
    type        = "origin"
    description = "Virtual Network"
    vm          = "ggstream-origin-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}
