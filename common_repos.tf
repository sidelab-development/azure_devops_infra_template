# Repository for the infrastructure as code
resource "azuredevops_git_repository" "infrastructure" {
  project_id = data.azuredevops_project.project.id
  name       = "infrastructure"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/sidelab-development/azure_infra_template.git"
  }
}

# Repository for the templates, specially the YAML for CI/CD pipelines
resource "azuredevops_git_repository" "templates" {
  project_id = data.azuredevops_project.project.id
  name       = "templates"

  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/sidelab-development/templates.git"
  }
}
