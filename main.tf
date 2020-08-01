provider "azurerm" {
  version = "~> 2.21"

  features {}
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "ggstream"

    workspaces {
      name = "terraform"
    }
  }
}

module "configs" {
  source = "./config"
}

module "arm" {
  source = "./arm"
}

