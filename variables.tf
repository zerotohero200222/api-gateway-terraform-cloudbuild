variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Deployment environment (dev, uat, prod)"
  type        = string
}

variable "api_id" {
  description = "API Gateway ID"
  type        = string
}

variable "api_display_name" {
  description = "Display name for the API"
  type        = string
}

variable "backend_url" {
  description = "Cloud Run or HTTPS backend endpoint"
  type        = string
}
