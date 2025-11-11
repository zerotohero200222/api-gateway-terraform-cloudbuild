output "api_gateway_name" {
  description = "The name of the API Gateway instance"
  value       = google_api_gateway_gateway.gateway.name
}

output "api_gateway_region" {
  description = "The region of the deployed API Gateway"
  value       = google_api_gateway_gateway.gateway.location
}

output "api_gateway_url" {
  description = "The public URL of the API Gateway"
  value       = google_api_gateway_gateway.gateway.default_hostname
}
