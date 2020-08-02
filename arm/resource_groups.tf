/**
 * Docker RG
 * RGId: azurerm_resource_group.docker.id
 */
resource "azurerm_resource_group" "docker" {
  name     = "ggstream-docker"
  location = "westus2"
  
  tags = {
    description = "North America"
    type        = "Docker"
    region      = "na"
    ring        = 0
  }
}

/**
 * Monitoring RG
 * RGId: azurerm_resource_group.monitor.id
 */
resource "azurerm_resource_group" "monitor" {
  name     = "ggstream-monitor"
  location = "westus2"

  tags = {
    description = "North America"
    type        = "Monitoring (AI/LA)"
    region      = "na"
    ring        = 0
  }
}

/**
 * TrafficManager RG
 * RGId: azurerm_resource_group.tm.id
 */
resource "azurerm_resource_group" "traffic" {
  name     = "ggstream-tm"
  location = "westus2"

  tags = {
    description = "North America"
    type        = "Traffic Manager"
    region      = "na"
    ring        = 0
  }
}

/**
 * Edge Region RGs
 * RGId: azurerm_resource_group.edge["{region}"].id
 */
resource "azurerm_resource_group" "edge" {
  for_each = module.configs.edgeRegions

  name     = "ggstream-edge-${each.key}"
  location = each.value.azLocation

  tags = {
    type        = "edge"
    description = each.value.name
    region      = each.key
    ring        = each.value.ring
  }
}
