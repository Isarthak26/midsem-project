variable "env_prefix" {
  description = "A prefix for all resources in this environment (e.g., 'dev')."
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
  default     = "East US"
}

variable "vm_admin_password" {
  description = "A secure password for the administrator of the virtual machine."
  type        = string
  sensitive   = true
}

variable "vm_count" {
  description = "Number of virtual machines to create."
  type        = number
  default     = 1
}