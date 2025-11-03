output "public_ip_output" {
  description = "The public IP address of the Application Gateway."
  value       = azurerm_public_ip.app_gateway_pip.ip_address
}