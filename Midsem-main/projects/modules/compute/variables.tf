
variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to deploy the VM into."
  type        = string
}

variable "vm_name_prefix" {
  description = "A prefix to use for the VM names."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM."
  type        = string
  sensitive   = true
}

variable "instance_count" {
  description = "The number of VM instances to create."
  type        = number
}