resource "google_artifact_registry_repository" "devops_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "python-app-repo"
  format        = "DOCKER"
  description   = "Docker repo for python app"
}
