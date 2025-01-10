resource "google_storage_bucket_object" "web_files" {
  for_each = fileset("${path.module}/webapp", "**")

  name   = each.key
  bucket = google_storage_bucket.static_website.name
  source = "${path.module}/webapp/${each.key}"

  content_type = lookup(
  {
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "png"  = "image/png",
    "jpg"  = "image/jpeg",
  },
  split(".", each.key)[length(split(".", each.key)) - 1],
  "application/octet-stream"
  )

  depends_on = [
    local_file.generated_index_html]
}

resource "google_storage_bucket_object" "index_html" {
  name = "index.html"
  bucket = google_storage_bucket.static_website.name
  source = "${path.module}/webapp/index.html"
  content_type = "text/html"

  depends_on = [
    local_file.generated_index_html]
}
