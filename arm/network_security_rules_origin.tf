resource "azurerm_network_security_rule" "origin_SSH" {
  for_each = module.configs.originNodes

  name                        = "SSH"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_WebRTC" {
  for_each = module.configs.originNodes

  name                        = "WebRTC"
  priority                    = 310
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3334"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_HLSDASH" {
  for_each = module.configs.originNodes

  name                        = "HLS_DASH"
  priority                    = 320
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "8443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_WebRTCICE" {
  for_each = module.configs.originNodes

  name                        = "WebRTC_ICE"
  priority                    = 330
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_ranges     = ["10000", "10005"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_OVT" {
  for_each = module.configs.originNodes

  name                        = "OVT"
  priority                    = 340
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 9000
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_RTMP" {
  for_each = module.configs.originNodes

  name                        = "RTMP"
  priority                    = 350
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 1935
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}

resource "azurerm_network_security_rule" "origin_MPEGTS" {
  for_each = module.configs.originNodes

  name                        = "MPEGTS"
  priority                    = 360
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Udp"
  source_port_range           = "*"
  destination_port_ranges     = ["4000", "4005"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.origin[each.value.region].name
  network_security_group_name = azurerm_network_security_group.origin[each.value.location].name
}