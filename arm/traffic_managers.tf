/**
 * Ingest Endpoint
 */
resource "azurerm_traffic_manager_profile" "ingest" {
  name                   = "ggstream-ingest"
  resource_group_name    = azurerm_resource_group.traffic.name
  traffic_routing_method = "Weighted"

  tags = {
    type        = "infra"
    description = "Traffic Manager"
    region      = "na"
    ring        = 0
  }

  dns_config {
    relative_name = "ggstream-ingest"
    ttl           = 60
  }

  monitor_config {
    protocol                     = "tcp"
    port                         = 1935
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
}

resource "cloudflare_record" "ingest" {
  zone_id = "d20b21d4be5f18b23eda0c3459814be1"
  name    = "ingest"
  value   = azurerm_traffic_manager_profile.ingest.fqdn
  type    = "CNAME"
  ttl     = 1
}

/**
 * Ingest Endpoints - Origin External
 */
resource "azurerm_traffic_manager_endpoint" "ingest_ext" {
  for_each = module.configs.originExtNodes

  name                = "origin-${each.key}"
  resource_group_name = azurerm_resource_group.traffic.name
  profile_name        = azurerm_traffic_manager_profile.ingest.name
  type                = "externalEndpoints"
  weight              = 100
  endpoint_location   = each.value.azLocation
  target              = each.value.endpoint
}

/**
 * Ingest Endpoints - Origin Azure
 */
resource "azurerm_traffic_manager_endpoint" "ingest_az" {
  for_each = module.configs.originNodes

  name                = "origin-${each.value.location}"
  resource_group_name = azurerm_resource_group.traffic.name
  profile_name        = azurerm_traffic_manager_profile.ingest.name
  type                = "azureEndpoints"
  weight              = 100
  target_resource_id  = azurerm_public_ip.origin[each.value.location].id
}

/**
 * Service Endpoint
 */
resource "azurerm_traffic_manager_profile" "svc" {
  name                   = "ggstream-svc"
  resource_group_name    = azurerm_resource_group.traffic.name
  traffic_routing_method = "Performance"

  tags = {
    type        = "infra"
    description = "Traffic Manager"
    region      = "na"
    ring        = 0
  }

  dns_config {
    relative_name = "ggstream-svc"
    ttl           = 60
  }

  monitor_config {
    protocol                     = "tcp"
    port                         = 3334
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 3
  }
}

resource "cloudflare_record" "svc" {
  zone_id = "d20b21d4be5f18b23eda0c3459814be1"
  name    = "svc"
  value   = azurerm_traffic_manager_profile.svc.fqdn
  type    = "CNAME"
  ttl     = 1
}

/**
 * Service Endpoints - Origin External
 */
resource "azurerm_traffic_manager_endpoint" "svc_ext" {
  for_each = module.configs.originExtNodes

  name                = "origin-${each.key}"
  resource_group_name = azurerm_resource_group.traffic.name
  profile_name        = azurerm_traffic_manager_profile.svc.name
  type                = "externalEndpoints"
  weight              = 100
  endpoint_location   = each.value.azLocation
  target              = each.value.endpoint
}

/**
 * Service Endpoints - Edge Azure
 */
resource "azurerm_traffic_manager_endpoint" "svc_az_edge" {
  for_each = module.configs.edgeNodes

  name                = "edge-${each.value.location}"
  resource_group_name = azurerm_resource_group.traffic.name
  profile_name        = azurerm_traffic_manager_profile.svc.name
  type                = "azureEndpoints"
  weight              = 100
  target_resource_id  = azurerm_public_ip.edge[each.value.location].id
}

/**
 * Service Endpoints - Origin Azure
 */
resource "azurerm_traffic_manager_endpoint" "svc_az_origin" {
  for_each = module.configs.originNodes

  name                = "origin-${each.value.location}"
  resource_group_name = azurerm_resource_group.traffic.name
  profile_name        = azurerm_traffic_manager_profile.svc.name
  type                = "azureEndpoints"
  weight              = 100
  target_resource_id  = azurerm_public_ip.origin[each.value.location].id
}
