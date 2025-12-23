locals {
  project_name = "tetris"
  location     = "canadacentral"

  resource_group_name = "${local.project_name}-rg"

  vnet = {
    name          = "terraformvnet"
    address_space = ["10.0.0.0/16"]
  }

  subnet = {
    name           = "subnet"
    address_prefix = ["10.0.0.0/20"]
  }

  nsg = {
    name = "myNSG"
  }

  lb = {
    name          = "myLB"
    frontend_name = "myPublicIP"
    sku           = "Standard"
  }

  vmss = {
    name      = "vmss-terraform"
    sku       = "Standard_B2s"
    instances = 1
    admin_user = "azureuser"
  }

  autoscale = {
    min     = 1
    max     = 10
    default = 3
    scale_out_cpu = 80
    scale_in_cpu  = 10
  }
}
