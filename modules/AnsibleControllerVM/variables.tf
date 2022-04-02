variable "resource_group_name" {
  type        = string
  description = "RG Name"
}

variable "location" {
  type        = string
  description = "RG Location"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
}

variable "admin_password" {
  type        = string
  description = "Admin password for VM"
}

variable "ansible_nic_id" {}

variable "pg_host" {}

variable "host_url" {}

variable "okta_org_url" {}

variable "okta_client_id" {}

variable "okta_secret" {}

variable "pg_user" {}

variable "pg_pass" {}

variable "okta_key" {
  type = string
}