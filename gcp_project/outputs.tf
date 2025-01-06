output "bucket_url" {
  value = "http://${google_storage_bucket.static_website.name}.storage.googleapis.com/index.html"
}

output "api_url" {
  value = google_cloud_run_v2_service.api_container.uri
}
