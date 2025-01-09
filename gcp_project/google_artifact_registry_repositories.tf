resource "google_artifact_registry_repository" "go_api_repo" {
  location    = "europe-west3"
  repository_id = "go-api-repo"
  format      = "DOCKER"
}
