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

output "originExtNodes" {
  value = var.originExtNodes
}
