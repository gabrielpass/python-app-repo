terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0" # Ajuste a versão conforme compatível
    }
  }
}

provider "google" {
  credentials = var.credentials_raw
  project     = var.project_id
  region      = var.region
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

# data "google_project" "current" {
#   project_id = var.project_id
# }

# output "project_name" {
#   value = data.google_project.current.name
# }
