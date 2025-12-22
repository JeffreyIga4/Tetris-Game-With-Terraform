terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate007"  
    storage_account_name = "day043738"                      
    container_name       = "tfstate"                      
    key                  = "dev.terraform.tfstate"        
  }
}