# Configure the Azure provider
provider "azurerm" {
  version = "=1.44.0"

  subscription_id = ""
  
}

# Create a new resource group
resource "azurerm_resource_group" "rg" {
    name     = "myTFResourceGroup"
    location = "eastus"
    
    tags = {
        Environment = "Terraform Getting Started"
        Team = "DevOps"   
    }


}