#defining the terraform provider
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=2.85.0"
#     }
#   }
# }

#defining the terraform backend
terraform {
  backend "azurerm" {
    
   }
}