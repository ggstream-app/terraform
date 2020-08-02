resource "azurerm_storage_account" "edge" {
  for_each = module.configs.edgeNodes

  name                     = "ggstreamedge${each.value.location}diag"
  resource_group_name      = azurerm_resource_group.edge[each.value.region].name
  location                 = each.value.azLocation
  account_kind = "Storage"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    type        = "edge"
    description = "Diagnostic Storage Account"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }

  network_rules {
    bypass = ["AzureServices"]
    default_action = "Allow"
  }
}
