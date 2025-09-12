resource "google_compute_instance" "container_vm" {
  name         = "container-vm"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable" # Container-Optimized OS
      size  = 50
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id
    access_config {} # IP externo
  }

  metadata = {
    # GCP vai iniciar este container automaticamente
    "gce-container-declaration" = <<-EOT
      spec:
        containers:
          - name: ${var.image_name}
            image: ${var.region}-docker.pkg.dev/${var.project_id}/${var.artifact_repo}/${var.image_name}:${var.image_tag}
            ports:
              - containerPort: 80
            stdin: false
            tty: false
        restartPolicy: Always
    EOT
  }

  tags = ["http-server"]

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  depends_on = [
    google_artifact_registry_repository.devops_repo,
    google_compute_firewall.allow_http
  ]
}

resource "google_compute_network" "vpc" {
  name                    = "vpc-devops"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-devops"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}


# Firewall para HTTP
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
