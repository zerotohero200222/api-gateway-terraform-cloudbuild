resource "google_api_gateway_api_config" "api_config" {
  provider      = google-beta
  api           = google_api_gateway_api.api.name
  api_config_id = "config-${var.environment}"

  openapi_documents {
    document {
      path     = "openapi.yaml"
      contents = filebase64("${path.module}/openapi.yaml")
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

