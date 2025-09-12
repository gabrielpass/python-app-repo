resource "google_cloudbuild_trigger" "github_trigger" {
  project = var.project_id
  name    = "github-python-app-trigger"

  github {
    owner = var.github_owner
    name  = "python-app-repo" # nome do repo criado no GitHub provider abaixo
    push {
      branch = "main"
    }
  }

  filename = "cloudbuild.yaml"

  substitutions = {
    "_ARTIFACT_REGISTRY_HOSTNAME" = "${var.region}-docker.pkg.dev"
    "_REPO_NAME"                  = google_artifact_registry_repository.devops_repo.repository_id
    "_IMAGE_NAME"                 = "python-app"
  }
  depends_on = [
    github_repository.python_app,                   # garante que o repo GitHub exista
    google_artifact_registry_repository.devops_repo # garante que o Artifact Registry exista
  ]

}
