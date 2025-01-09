resource "google_cloud_run_service_iam_policy" "allow_access" {
  location = google_cloud_run_v2_service.api_container.location
  service = google_cloud_run_v2_service.api_container.name

  policy_data = data.google_iam_policy.allow_access.policy_data
}

resource "google_cloud_run_service_iam_policy" "allow_custom_access" {
  location = google_cloud_run_v2_service.custom_api_container.location
  service = google_cloud_run_v2_service.custom_api_container.name

  policy_data = data.google_iam_policy.allow_access.policy_data
}
