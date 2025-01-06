output "bucket_url" {
  value = "http://${google_storage_bucket.static_website.name}.storage.googleapis.com/index.html"
}
