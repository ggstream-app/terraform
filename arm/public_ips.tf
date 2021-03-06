resource "azurerm_public_ip" "edge" {
  for_each = module.configs.edgeNodes

  name                = "ggstream-edge-${each.value.location}-ip"
  resource_group_name = azurerm_resource_group.edge[each.value.region].name
  location            = each.value.azLocation
  allocation_method   = "Static"
  domain_name_label   = "ggstream-edge-${each.value.location}"

  tags = {
    type        = "edge"
    description = "Public IP"
    vm          = "ggstream-edge-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}

resource "cloudflare_record" "edge" {
  for_each = module.configs.edgeNodes

  zone_id = "d20b21d4be5f18b23eda0c3459814be1"
  name    = "svc-az${each.value.location}"
  value   = azurerm_public_ip.edge[each.value.location].ip_address
  type    = "A"
  ttl     = 1
}

resource "azurerm_public_ip" "origin" {
  for_each = module.configs.originNodes

  name                = "ggstream-origin-${each.value.location}-ip"
  resource_group_name = azurerm_resource_group.origin[each.value.region].name
  location            = each.value.azLocation
  allocation_method   = "Static"
  domain_name_label   = "ggstream-origin-${each.value.location}"

  tags = {
    type        = "origin"
    description = "Public IP"
    vm          = "ggstream-origin-${each.value.location}"
    region      = each.value.region
    ring        = each.value.ring
  }
}

resource "cloudflare_record" "origin" {
  for_each = module.configs.originNodes

  zone_id = "d20b21d4be5f18b23eda0c3459814be1"
  name    = "svc-az${each.value.location}"
  value   = azurerm_public_ip.origin[each.value.location].ip_address
  type    = "A"
  ttl     = 1
}