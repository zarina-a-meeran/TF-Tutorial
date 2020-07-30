provider "azurerm" {
  version = "=1.44.0"
  subscription_id = "" 
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
    name     = "${var.prefix}rg"
    location = "westeurope"
}

resource "azurerm_app_service_plan" "asp" {
  name = "${var.prefix}-asp"
  location = "westeurope"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.prefix}-appservice"
  location = "westeurope"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.asp.id}"

  site_config {
    linux_fx_version = "PHP|7.0"
    scm_type         = "LocalGit"
  }
}

