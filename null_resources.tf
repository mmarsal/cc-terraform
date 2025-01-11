resource "null_resource" "gcloud_auth" {
  depends_on = [google_artifact_registry_repository.go_api_repo]

  provisioner "local-exec" {
    command = <<EOT
      gcloud auth configure-docker europe-west3-docker.pkg.dev
    EOT
  }
}

resource "null_resource" "docker_build" {
  depends_on = [null_resource.gcloud_auth]

  provisioner "local-exec" {
    command = <<EOT
       docker build -t europe-west3-docker.pkg.dev/${var.project_id}/go-api-repo/my-app:latest -f ./custom_api/Dockerfile ./custom_api
    EOT
  }
}

resource "null_resource" "docker_push" {
  depends_on = [null_resource.docker_build]

  provisioner "local-exec" {
    command = <<EOT
      docker push europe-west3-docker.pkg.dev/${var.project_id}/go-api-repo/my-app:latest
    EOT
  }
}
