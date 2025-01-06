resource "google_cloud_run_service_iam_policy" "allow_access" {
  location = google_cloud_run_v2_service.api_container.location
  service = google_cloud_run_v2_service.api_container.name

  policy_data = data.google_iam_policy.allow_access.policy_data
}
