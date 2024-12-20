resource "google_storage_bucket" "static-site" {
  name          = "static-site"
  location      = "EU"

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
  }
}
