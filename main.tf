# 1. THE IMPORT BLOCK
# This stops the "Resource already exists" error by adopting the existing RG
import {
  to = azurerm_resource_group.rg
  id = "/subscriptions/d008c7cc-9795-4292-bf79-74ae52cda63d/resourceGroups/LabsKraft-Ted"
}

# 2. RESOURCE GROUP
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags = {
    env = var.tags
  }
}

# 3. STORAGE ACCOUNT
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    env = var.tags
  }
}

# 4. STORAGE CONTAINER
resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}