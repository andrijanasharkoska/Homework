
variable "my_name" {
  type        = string
  description = "My name"
}

variable "environment" {
  type        = string
  description = "Environment where all resources will be placed"
}

variable "location" {
  type        = string
  description = "The location where all resources will be placed"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "vms_subnet_id" {
  type        = string
  description = "Subnet"
}

variable "my_public_ip" {
  type        = string
  description = "The public IP address"
}
variable "base_name" {
  type        = string
  description = "Base name"
}
