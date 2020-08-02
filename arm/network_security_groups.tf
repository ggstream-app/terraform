resource "azurerm_network_security_group" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-nsg"
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.edge[each.value.region].name

  tags = {
    type        = "edge"
    description = "Network Security Group"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}

resource "azurerm_network_interface_security_group_association" "edge" {
  for_each = module.configs.edgeNodes

  network_interface_id      = azurerm_network_interface.edge[each.value.location].id
  network_security_group_id = azurerm_network_security_group.edge[each.value.location].id
}

resource "azurerm_network_security_group" "origin" {
  for_each = module.configs.originNodes

  name                = "ggstream-origin-${each.value.location}-nsg"
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.origin[each.value.region].name

  tags = {
    type        = "origin"
    description = "Network Security Group"
    vm          = "ggstream-origin-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}

resource "azurerm_network_interface_security_group_association" "origin" {
  for_each = module.configs.originNodes

  network_interface_id      = azurerm_network_interface.origin[each.value.location].id
  network_security_group_id = azurerm_network_security_group.origin[each.value.location].id
}