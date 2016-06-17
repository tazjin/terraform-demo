# Google Cloud provider setup

provider "google" {
  project = "prismatic-rock-134523"
  region  = "europe-west1"
}

# Variable declarations (loaded from tfvars file)
variable "k8s_password" {}

# Variable declarations with defaults
variable "k8s_zone" {
  default = "europe-west1-b"
}

# Configure Container Engine cluster
resource "google_container_cluster" "demo-cluster" {
  name               = "nordcloud-demo"
  zone               = "${var.k8s_zone}"
  initial_node_count = 3
  description        = "Presentation demo cluster"

  master_auth {
    username = "admin"
    password = "${var.k8s_password}"
  }

  node_config {
    machine_type       = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}

resource "google_compute_global_address" "somename" {
  name = "some-name"
}
