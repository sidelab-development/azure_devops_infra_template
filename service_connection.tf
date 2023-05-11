data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.current.subscription_id
}
resource "azuredevops_serviceendpoint_azurerm" "service_connection" {
  # Reference: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/serviceendpoint_azurerm
  project_id                = azuredevops_project.project.id
  service_endpoint_name     = "${var.project_name}-ado-to-arm"
  azurerm_spn_tenantid      = data.azurerm_client_config.current.tenant_id
  azurerm_subscription_id   = data.azurerm_client_config.current.subscription_id
  azurerm_subscription_name = data.azurerm_subscription.current.display_name
}
