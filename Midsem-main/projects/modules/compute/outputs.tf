output "private_ip_outputs" {
  description = "A list of the private IP addresses of the created VMs."
  value       = azurerm_network_interface.vm_nic[*].private_ip_address
}