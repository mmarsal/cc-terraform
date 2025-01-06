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
