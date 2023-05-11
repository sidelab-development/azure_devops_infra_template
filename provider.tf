terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.5.0" # If starting a new project, change it to the latest version
    }
  }
  # More details: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs

  backend "azurerm" {
    resource_group_name  = "myprojecttfstate" # Change to the name of your resource group
    storage_account_name = "myprojecttfstate" # Change to the name of your storage account
    container_name       = "tfstate"
    key                  = "azuredevops.tfstate"
  }
  # More details: https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
}

provider "azurerm" {
  features {}
}
provider "azuredevops" {}

# If the project is already created, uncomment the following data source block
# data "azuredevops_project" "example" {
#   name = "My Project" # Change this to the name of your project
# }
# More details: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/data-sources/project

# If the project is not created yet, uncomment the following resource block
# resource "azuredevops_project" "project" {
#   name        = "My Project" # Change this to the name of your project
# }
# More details: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/project
