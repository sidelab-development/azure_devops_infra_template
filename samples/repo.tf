locals {
  my_function_app = "my-function-app"
}

resource "azuredevops_git_repository" "function_app_repo" {
  # Reference: https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/git_repository
  project_id = data.azuredevops_project.project.id
  name       = local.my_function_app

  # If you need start with a blank repository, uncomment the following block
  # initialization {
  #   init_type = "Clean"
  # }

  # If you need to start using a template, uncomment the following block
  # initialization {
  #   init_type   = "Import"
  #   source_type = "Git"
  #   source_url  = "https://SAME_OF_OUR_TEMPLATES.git"
  #   # Our templates
  #   # - Function App: https://github.com/sidelab-development/function_app_template.git
  #   # - React JS: https://github.com/sidelab-development/react_template.git
  #   # - React Native: https://github.com/sidelab-development/react_native_template.git
  # }
}
