resource "azurerm_subnet" "edge" {
  for_each = module.configs.edgeNodes

  name                 = "default"
  resource_group_name  = azurerm_resource_group.edge[each.value.region].name
  virtual_network_name = azurerm_virtual_network.edge[each.value.location].name
  address_prefixes     = ["10.0.1.0/24"]
}