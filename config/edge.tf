/**
 * Edge Regions and Nodes
 */

variable "edgeRegions" {
  type = map(object({
    name       = string
    azLocation = string
    wave        = number
  }))
  default = {
    "asia" = {
      name       = "Asia",
      azLocation = "southeastasia"
      wave       = 1
    },
    "eu" = {
      name       = "Europe",
      azLocation = "westeurope"
      wave       = 1
    },
    "na" = {
      name       = "North America"
      azLocation = "westus2"
      wave       = 1
    }
  }
}

variable "edgeNodes" {
  type = map(object({
    location   = string
    name       = string
    azLocation = string
    region     = string
    wave       = number
  }))

  default = {
    "cac" = {
      location   = "cac"
      azLocation = "canadacentral"
      name       = "Canada Central"
      region     = "na"
      wave       = 1
    },
    "cus" = {
      location   = "cus"
      azLocation = "centralus"
      name       = "Central US"
      region     = "na"
      wave       = 1
    },
    "eus" = {
      location   = "eus"
      azLocation = "eastus"
      name       = "East US"
      region     = "na"
      wave       = 1
    },
    "scus" = {
      location   = "scus"
      azLocation = "southcentralus"
      name       = "South Central US"
      region     = "na"
      wave       = 1
    },
    "wus" = {
      location   = "wus"
      azLocation = "westus"
      name       = "West US"
      region     = "na"
      wave       = 1
    },
    "neu" = {
      location   = "neu"
      azLocation = "northeurope"
      name       = "North Europe"
      region     = "eu"
      wave       = 1
    },
    "weu" = {
      location   = "weu"
      azLocation = "westeurope"
      name       = "West Europe"
      region     = "eu"
      wave       = 1
    },
    "jpe" = {
      location   = "jpe"
      azLocation = "japaneast"
      name       = "Japan East"
      region     = "asia"
      wave       = 1
    },
    "seasia" = {
      location   = "seasia"
      azLocation = "southeastasia"
      name       = "Southeast Asia"
      region     = "asia"
      wave       = 1
    }
  }
}

output "edgeRegions" {
  value = var.edgeRegions
}

output "edgeNodes" {
  value = var.edgeNodes
}
