output "lb_ip" {
  description = "Global Load Balancer static IP address"
  value       = google_compute_global_address.lb_ip.address
}

output "ssl_certificate_domains" {
  description = "Domains covered by the Google-managed SSL certificate"
  value       = google_compute_managed_ssl_certificate.lb_cert.managed[0].domains
}

output "url_map_self_link" {
  description = "Self link of the URL map used by the load balancer"
  value       = google_compute_url_map.lb_urlmap.self_link
}

output "https_proxy_self_link" {
  description = "Self link of the target HTTPS proxy"
  value       = google_compute_target_https_proxy.lb_proxy.self_link
}

output "forwarding_rule_self_link" {
  description = "Self link of the global forwarding rule"
  value       = google_compute_global_forwarding_rule.lb_forwarding_rule.self_link
}
