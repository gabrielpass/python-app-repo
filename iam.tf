# Cloud Build service account is: SERVICE_PROJECT_NUMBER@cloudbuild.gserviceaccount.com
data "google_project" "project" {
  project_id = var.project_id
}

# Mais simples: bind role directly to cloudbuild service account principal
resource "google_project_iam_binding" "cloudbuild_artifactregistry" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
  ]
}
