resource "google_cloud_run_v2_service" "api_container" {
  name = "api-container"
  location = "europe-west3"

  template {
    containers {
      image = "docker.io/kennethreitz/httpbin"
      ports {
        name = "http1"
        container_port = 80
      }
    }
  }

  traffic {
    type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_v2_service" "custom_api_container" {
  name     = "custom-api-container"
  location = "europe-west3"

  template {
    containers {
      image = "europe-west3-docker.pkg.dev/${var.project_id}/go-api-repo/my-app:latest"
      ports {
        container_port = 8080
      }
    }
  }

  traffic {
    type = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  depends_on = [
    google_artifact_registry_repository.go_api_repo,
    null_resource.gcloud_auth,
    null_resource.docker_build,
    null_resource.docker_push
  ]
}
