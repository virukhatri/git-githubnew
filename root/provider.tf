terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "5.0.1"
        }
    }
    backend "azurerm" {
        resource_group_name  = "terraform-backend-viru"  # this is for testing the commit and testing the pipeline
        storage_account_name = "virustorage"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
    features {}
}
