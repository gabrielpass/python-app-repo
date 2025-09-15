output "artifact_registry_repo" {
  value = google_artifact_registry_repository.devops_repo.name
}

output "cloudbuild_trigger_id" {
  value = google_cloudbuild_trigger.github_trigger.id
}

output "github_repo_url" {
  value = github_repository.python_app.html_url
}

# output "vm_name" {
#   value = google_compute_instance.container_vm.name
# }

# output "vm_external_ip" {
#   value = google_compute_instance.container_vm.network_interface[0].access_config[0].nat_ip
# }
