resource "google_storage_bucket_iam_member" "allow_access" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
