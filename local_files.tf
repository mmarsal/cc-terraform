resource "local_file" "generated_index_html" {
  filename = "${path.module}/webapp/index.html"
  content = templatefile("${path.module}/webapp/index.html.tmpl", {
    api_url = google_cloud_run_v2_service.api_container.uri,
    custom_api_url = google_cloud_run_v2_service.custom_api_container.uri
  })
}
