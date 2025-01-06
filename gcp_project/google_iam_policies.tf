data "google_iam_policy" "allow_access" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
