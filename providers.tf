terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.117"
    }
  }
  required_version = ">= 1.13.3"

  backend "azurerm" {
    resource_group_name  = "AshaRG"
    storage_account_name = "dkterraformstate"
    container_name       = "terraformstatefile"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
