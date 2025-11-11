# Create the API
resource "google_api_gateway_api" "api" {
  api_id       = "${var.api_id}-${var.environment}"
  display_name = "${var.api_display_name}-${var.environment}"
}

# Create API Config
resource "google_api_gateway_api_config" "api_config" {
  api           = google_api_gateway_api.api.name
  api_config_id = "config-${var.environment}"
  openapi_documents {
    document {
      path     = "openapi.yaml"
      contents = file("${path.module}/openapi.yaml")
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

# Create API Gateway
resource "google_api_gateway_gateway" "gateway" {
  name        = "${var.api_id}-gateway-${var.environment}"
  api_config  = google_api_gateway_api_config.api_config.name
  location    = var.region
}
