output "api_gateway_name" {
  description = "The name of the API Gateway"
  value       = google_api_gateway_gateway.gateway.name
}

output "api_gateway_url" {
  description = "The endpoint URL of the API Gateway"
  value       = google_api_gateway_gateway.gateway.default_hostname
}
