terraform {
  backend "azurerm" {}
}
provider "azurerm" {
  features {

  }
}
data "azurerm_subscription" "current" {}

locals {
  base_name         = "${var.my_name}-${var.environment}"
  network_base_name = "${local.base_name}-ntwrk"
  vm_name           = "${var.base_name}-vm"
}

resource "azurerm_resource_group" "rg7" {
  name     = "${local.network_base_name}-rg"
  location = var.location
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "${local.network_base_name}-vnet"
  location            = azurerm_resource_group.rg7.location
  resource_group_name = azurerm_resource_group.rg7.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "sub0" {
  name                 = "${azurerm_virtual_network.vnet1.name}-vms-snet"
  resource_group_name  = azurerm_resource_group.rg7.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.1.0/24"]
}


module "vm" {
  source    = "./vm_module"
  base_name = local.base_name
  location  = var.location
}
