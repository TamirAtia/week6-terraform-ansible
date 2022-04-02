variable "resource_group_name" {
  type        = string
  description = "RG Name"
}

variable "location" {
  type        = string
  description = "RG Location"
}


variable "myIP_Address" {
  type = string
  description = "IP address to connect ssh to the VM"
}
