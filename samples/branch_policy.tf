resource "azuredevops_branch_policy_min_reviewers" "example" {
  project_id = azuredevops_project.project.id

  enabled  = true
  blocking = true

  settings {
    reviewer_count               = 1
    last_pusher_cannot_approve   = true
    on_push_reset_approved_votes = true

    scope {
      repository_id  = azuredevops_git_repository.function_app_repo.id
      repository_ref = "refs/heads/main"
      match_type     = "Exact"
    }

    scope {
      repository_id  = azuredevops_git_repository.function_app_repo.id
      repository_ref = "refs/heads/homolog"
      match_type     = "Exact"
    }

    scope {
      repository_id  = azuredevops_git_repository.function_app_repo.id
      repository_ref = "refs/heads/develop"
      match_type     = "Exact"
    }
  }
}
