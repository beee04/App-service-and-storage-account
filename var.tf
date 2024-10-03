variable "name" {
  description = "The name of the resource."
  type        = string
}

variable "location" {
  description = "The location of the resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}
