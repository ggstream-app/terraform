resource "azurerm_network_interface" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-nic"
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.edge[each.value.region].name

  tags = {
    type        = "edge"
    description = "Network Interface Card"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.edge[each.value.location].id
    public_ip_address_id          = azurerm_public_ip.edge[each.value.location].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "origin" {
  for_each = module.configs.originNodes

  name                = "ggstream-origin-${each.value.location}-nic"
  location            = each.value.azLocation
  resource_group_name = azurerm_resource_group.origin[each.value.region].name

  tags = {
    type        = "origin"
    description = "Network Interface Card"
    vm          = "ggstream-origin-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.origin[each.value.location].id
    public_ip_address_id          = azurerm_public_ip.origin[each.value.location].id
    private_ip_address_allocation = "Dynamic"
  }
}
