resource "google_storage_bucket_object" "index_html" {
  name   = "index.html"
  bucket = google_storage_bucket.static_website.name
  source = "${path.module}/webapp/index.html"
  content_type = "text/html"
}
