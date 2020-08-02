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
    wave        = each.value.wave
  }
}

resource "azurerm_network_interface_security_group_association" "edge" {
  for_each = module.configs.edgeNodes

  network_interface_id      = azurerm_network_interface.edge[each.value.location].id
  network_security_group_id = azurerm_network_security_group.edge[each.value.location].id
}