/**
 * Origin Regions and Nodes
 */

variable "originRegions" {
  type = map(object({
    name       = string
    azLocation = string
    ring        = number
  }))
  default = {
    "asia" = {
      name       = "Asia",
      azLocation = "eastasia"
      ring       = 1
    },
    "na" = {
      name       = "North America"
      azLocation = "westus2"
      ring       = 1
    }
  }
}

variable "originNodes" {
  type = map(object({
    location   = string
    name       = string
    azLocation = string
    region     = string
    ring       = number
  }))

  default = {
    "ncus" = {
      location   = "ncus"
      azLocation = "northcentralus"
      name       = "North Central US"
      region     = "na"
      ring       = 1
    },
    "easia" = {
      location   = "easia"
      azLocation = "eastasia"
      name       = "East Asia"
      region     = "asia"
      ring       = 0
    }
  }
}

/**
 * Origin Regions and Nodes
 */
variable "originExtNodes" {
  type = map(object({
    name       = string
    azLocation = string
    endpoint     = string
  }))

  default = {
    "sea" = {
      azLocation = "westus2"
      name       = "Seattle Origin"
      endpoint     = "ne.sea.core.zhr.one"
    }
  }
}

output "originRegions" {
  value = var.originRegions
}
output "originNodes" {
  value = var.originNodes
}

output "originExtNodes" {
  value = var.originExtNodes
}
