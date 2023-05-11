resource "azuredevops_build_definition" "function_app_pipe" {
  # Reference: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/build_definition
  for_each = {
    for index, environment in var.environments : environment.name => environment
  }

  project_id = var.project_id
  name       = "sample_${each.value.name}"

  ci_trigger {
    override {
      branch_filter {
        include = [each.value.branch]
      }
      path_filter {
        exclude = []
        include = []
      }
    }
  }

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.function_app_repo.id
    branch_name = "refs/heads/${each.value.branch}"
    yml_path    = "azure-pipelines.yml"
  }

  # If you need a pipeline for Function App, uncomment the following block
  # variable {
  #   name  = "STAGE"
  #   value = each.value.name
  # }
  # variable {
  #   name  = "SC_TO_AZURE_RM"
  #   value = azuredevops_serviceendpoint_azurerm.service_connection.service_endpoint_name
  # }
  # variable {
  #   name  = "FUNCTION_APP_NAME"
  #   value = "sample-${each.value.name}"
  # }
  # variable {
  #   name  = "KV_NAME"
  #   value = "sample${each.value.name}"
  # }
  # variable {
  #   name  = "DB_CONN_STRING_KV_SECRET_NAME"
  #   value = "sample-db-conn-string"
  # }

  # If you need a pipeline for React JS, uncomment the following block
  # variable {
  #   name  = "API_URL"
  #   value = "https://sample-${each.value.name}.azurewebsites.net/api/v1"
  # }
  # variable {
  #   name  = "STAGE"
  #   value = each.value.name
  # }
  # variable {
  #   name  = "SC_TO_AZURE_RM"
  #   value = azuredevops_serviceendpoint_azurerm.service_connection.service_endpoint_name
  # }
  # variable {
  #   name  = "AZURE_STORAGE_ACCOUNT"
  #   value = "sample${each.value.name}"
  # }
  # variable {
  #   name  = "AZURE_STORAGE_CONTAINER"
  #   value = "$web"
  # }

  # If you need a pipeline for React Native, uncomment the following block
  # variable {
  #   name  = "STAGE"
  #   value = each.value.name
  # }
  # variable {
  #   name  = "EXPO_USER"
  #   value = "EXPO_USER"
  # }
  # variable {
  #   name  = "EXPO_PASSWORD"
  #   value = "EXPO_PASSWORD"
  # }
}
