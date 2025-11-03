
module "networking" {
  source = "../../modules/networking"

  resource_group_name = "${var.env_prefix}-rg"
  location            = var.location
  vnet_name           = "${var.env_prefix}-vnet"
  subnet_name_prefix  = var.env_prefix 
}


module "compute" {
  source = "../../modules/compute"

  resource_group_name = module.networking.rg_name_output
  location            = module.networking.location_output
  subnet_id           = module.networking.private_subnet_id_output 
  vm_name_prefix      = "${var.env_prefix}-vm"
  admin_username      = "adminuser"
  admin_password      = var.vm_admin_password
  instance_count      = var.vm_count
}


module "loadbalancer" {
  source = "../../modules/loadbalancer"

  resource_group_name  = module.networking.rg_name_output
  location             = module.networking.location_output
  subnet_id            = module.networking.gateway_subnet_id_output 
  app_gateway_name     = "${var.env_prefix}-appgateway"
  backend_ip_addresses = module.compute.private_ip_outputs

  depends_on = [module.compute]
}