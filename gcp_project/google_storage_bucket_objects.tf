resource "google_storage_bucket_object" "files" {
  for_each = {
    "index.html" = "webapp/index.html"
    "script.js"  = "webapp/script.js"
  }

  name   = each.key
  bucket = google_storage_bucket.static_website.name

  source = each.value

  content_type = lookup(
  {
    "index.html" = "text/html",
    "script.js"  = "application/javascript"
  },
  each.key,
  "application/octet-stream"
  )
}
