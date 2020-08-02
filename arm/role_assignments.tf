resource "azurerm_role_assignment" "edge" {
  for_each = module.configs.edgeNodes

  scope                = azurerm_resource_group.docker.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_linux_virtual_machine.edge[each.value.location].identity[0]["principal_id"]
}

resource "azurerm_role_assignment" "origin" {
  for_each = module.configs.originNodes

  scope                = azurerm_resource_group.docker.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_linux_virtual_machine.origin[each.value.location].identity[0]["principal_id"]
}
