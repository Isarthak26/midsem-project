output "application_url" {
  description = "The URL to access your Nginx application."
  value       = "http://${module.loadbalancer.public_ip_output}"
}