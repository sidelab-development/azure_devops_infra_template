# If the service connection is not created yet, uncomment the following resource block
# data "azurerm_client_config" "current" {}
# data "azurerm_subscription" "current" {
#   subscription_id = data.azurerm_client_config.current.subscription_id
# }
# resource "azuredevops_serviceendpoint_azurerm" "serviceendpoint" {
#   # Reference: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm
#   project_id                = azuredevops_project.project.id
#   service_endpoint_name     = "sc-${var.project_name}"
#   azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
#   azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
# }

# If the service connection is already created, uncomment the following data source block
# data "azuredevops_serviceendpoint_azurerm" "serviceendpoint" {
#   project_id          = azuredevops_project.project.id
#   service_endpoint_id = "00000000-0000-0000-0000-000000000000"
# }
