resource "azurerm_role_assignment" "edge" {
  for_each = module.configs.edgeNodes

  scope                = azurerm_resource_group.docker.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_linux_virtual_machine.edge[each.value.location].identity[0]["principal_id"]
}
