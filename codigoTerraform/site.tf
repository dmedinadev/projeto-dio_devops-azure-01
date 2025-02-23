# Terraform Settings Block
terraform {
  #required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.3.0" # Optional but recommended in production
    }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "7c504b4f-5f1c-4d62-8ed5-413d93c4f0dd"
}
# Create Resource Group 
resource "azurerm_resource_group" "rg" {
  location = "Brazil South"
  name     = "rg-azuredevops-dev-01"
  tags = merge(var.tags, {
    "workspace" = "${terraform.workspace}"
    }
  )
}

resource "azurerm_storage_account" "site" {
  name                      = "sta-azuredevops-dev-01"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  https_traffic_only_enabled = true

  static_website {
    index_document = "index.html"
  }

  tags = merge(var.tags, {
    "workspace" = "${terraform.workspace}"
    }
  )
}
