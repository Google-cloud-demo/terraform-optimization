
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

resource "google_container_node_pool" "device" {
  name    = "device"
  cluster = google_container_cluster.primary.id

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 0
    max_node_count = 4
  }

  node_config {
    preemptible  = true
    machine_type = "e2-small"
    disk_size_gb = 30


    labels = {
      team = "devops"
    }

    taint {
      key    = "instance_type"
      value  = "device"
      effect = "NO_SCHEDULE"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
