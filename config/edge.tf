/**
 * Edge Regions and Nodes
 */

variable "edgeRegions" {
  type = map(object({
    name       = string
    azLocation = string
  }))
  default = {
    "asia" = {
      name       = "Asia",
      azLocation = "southeastasia"
    },
    "eu" = {
      name       = "Europe",
      azLocation = "westeurope"
    },
    "na" = {
      name       = "North America"
      azLocation = "westus2"
    }
  }
}

variable "edgeNodes" {
  type = map(object({
    location   = string
    name       = string
    azLocation = string
    region     = string
  }))

  default = {
    # "cac" = {
    #   location   = "cac"
    #   azLocation = "canadacentral"
    #   name       = "Canada Central"
    #   region     = "na"
    # },
    # "cus" = {
    #   location   = "cus"
    #   azLocation = "centralus"
    #   name       = "Central US"
    #   region     = "na"
    # },
    # "eus" = {
    #   location   = "eus"
    #   azLocation = "eastus"
    #   name       = "East US"
    #   region     = "na"
    # },
    # "scus" = {
    #   location   = "scus"
    #   azLocation = "southcentralus"
    #   name       = "South Central US"
    #   region     = "na"
    # },
    # "wus" = {
    #   location   = "wus"
    #   azLocation = "westus"
    #   name       = "West US"
    #   region     = "na"
    # },
    # "neu" = {
    #   location   = "neu"
    #   azLocation = "northeurope"
    #   name       = "North Europe"
    #   region     = "eu"
    # },
    # "weu" = {
    #   location   = "weu"
    #   azLocation = "westeurope"
    #   name       = "West Europe"
    #   region     = "eu"
    # },
    # "jpe" = {
    #   location   = "jpe"
    #   azLocation = "japaneast"
    #   name       = "Japan East"
    #   region     = "asia"
    # },
    # "seasia" = {
    #   location   = "seasia"
    #   azLocation = "southeastasia"
    #   name       = "Southeast Asia"
    #   region     = "asia"
    # }
  }
}

output "edgeRegions" {
  value = var.edgeRegions
}

output "edgeNodes" {
  value = var.edgeNodes
}
