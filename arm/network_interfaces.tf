resource "azurerm_network_interface" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-nic"
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.edge[each.value.region].name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.edge[each.value.location].id
    public_ip_address_id          = azurerm_public_ip.edge[each.value.location].id
    private_ip_address_allocation = "Dynamic"
  }
}
