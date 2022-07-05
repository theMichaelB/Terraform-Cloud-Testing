terraform {

  cloud {
    organization = "CloudFromScratch"

    workspaces {
      name = "TestSpace"
    }
  }
  required_version = ">=1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.12.0"
    }
  }
}
provider "azurerm" {
  features {}
}