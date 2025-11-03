
output "rg_name_output" { value = azurerm_resource_group.main.name }
output "location_output" { value = azurerm_resource_group.main.location }
output "private_subnet_id_output" { value = azurerm_subnet.private.id }
output "gateway_subnet_id_output" { value = azurerm_subnet.gateway.id }