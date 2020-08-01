resource "azurerm_storage_account" "edge" {
  for_each = module.configs.edgeNodes

  name                     = "ggstreamedge${each.value.location}diag"
  resource_group_name      = azurerm_resource_group.edge[each.value.region].name
  location                 = each.value.azLocation
  account_kind = "Storage"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    bypass = ["AzureServices"]
    default_action = "Allow"
  }
}
