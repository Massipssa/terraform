# Provider section
provider "azurerm" {
  features {}
}

# Data source section: references existing resources

# Resource section
resource "azurerm_resource_group" "test_resource_group" {
  name = var.resource_group_name
  location = var.resource_location
}

resource "azurerm_storage_account" "storage_account" {
  name = var.storage_account_name
  location = azurerm_resource_group.test_resource_group.location
  resource_group_name = azurerm_resource_group.test_resource_group.name
  account_replication_type = "LRS"
  account_tier = "Standard"
}