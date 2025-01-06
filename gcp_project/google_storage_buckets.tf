resource "google_storage_bucket" "static_website" {
  name                        = "cc-terraform-static-website-${random_string.unique_suffix.result}"
  location                    = "US"
  storage_class               = "STANDARD"
  force_destroy               = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
