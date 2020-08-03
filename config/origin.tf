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
    # "asia" = {
    #   name       = "Asia",
    #   azLocation = "koreacentral"
    #   ring       = 1
    # },
    # "na" = {
    #   name       = "North America"
    #   azLocation = "westus2"
    #   ring       = 1
    # }
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
    "wus2" = {
      location   = "wus2"
      azLocation = "westus2"
      name       = "West US 2"
      region     = "na"
      ring       = 1
    },
    "koc" = {
      location   = "koc"
      azLocation = "koreacentral"
      name       = "Korea Central"
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
