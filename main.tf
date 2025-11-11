########################################################
# API Gateway Terraform Configuration
# - Creates an API Gateway API
# - Creates an API Config using OpenAPI spec (Base64 encoded)
# - Creates an API Gateway instance (Gateway)
# - Uses google-beta provider for these resources
########################################################

# API definition
resource "google_api_gateway_api" "api" {
  provider     = google-beta
  api_id       = "${var.api_id}-${var.environment}"
  display_name = "${var.api_display_name}-${var.environment}"
}

# API configuration (OpenAPI spec)
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

# Gateway definition
resource "google_api_gateway_gateway" "gateway" {
  provider    = google-beta
  name        = "${var.api_id}-gateway-${var.environment}"
  api_config  = google_api_gateway_api_config.api_config.name
  location    = var.region

  labels = {
    environment = var.environment
  }
}
