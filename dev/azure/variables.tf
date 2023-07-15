# Enables separation of environment variable specif values
variable "resource_group_name" {
  type = string
  default = "test"
  description = "This is the resource group name"
}

variable "storage_account_name" {
  type = string
  default = "testmassistorageaccount"
  description = "This is storage account name"
}

variable "resource_location" {
  type = string
  default = "East US"
}