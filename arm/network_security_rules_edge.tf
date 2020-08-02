resource "azurerm_network_security_rule" "edge_SSH" {
  for_each = module.configs.edgeNodes

  name                        = "SSH"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.edge[each.value.region].name
  network_security_group_name = azurerm_network_security_group.edge[each.value.location].name
}

resource "azurerm_network_security_rule" "edge_WebRTC" {
  for_each = module.configs.edgeNodes

  name                        = "WebRTC"
  priority                    = 310
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3334"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.edge[each.value.region].name
  network_security_group_name = azurerm_network_security_group.edge[each.value.location].name
}

resource "azurerm_network_security_rule" "edge_HLSDASH" {
  for_each = module.configs.edgeNodes

  name                        = "HLS_DASH"
  priority                    = 320
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.edge[each.value.region].name
  network_security_group_name = azurerm_network_security_group.edge[each.value.location].name
}

resource "azurerm_network_security_rule" "edge_WebRTCICE" {
  for_each = module.configs.edgeNodes

  name                        = "WebRTC_ICE"
  priority                    = 330
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_ranges     = ["10000", "10005"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.edge[each.value.region].name
  network_security_group_name = azurerm_network_security_group.edge[each.value.location].name
}
