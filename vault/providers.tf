terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.13.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cx-devsecops-tfstates"
    storage_account_name = "cfxcoretfstates"
    container_name       = "vault"
    key                  = "vault.tfstate"
  }
}

provider "vault" {
  address = "https://vault.cofinity-x.com"
}

provider "azurerm" {
  features {}
}
