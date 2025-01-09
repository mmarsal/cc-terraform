resource "google_storage_bucket_object" "index_html" {
  name = "index.html"
  bucket = google_storage_bucket.static_website.name
  source = "${path.module}/generated/index.html"
  content_type = "text/html"

  depends_on = [
    local_file.generated_index_html]
}
