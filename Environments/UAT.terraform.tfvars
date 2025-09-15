resource_group = {
    "rg1_uat" = {
        name     = "rg1-uat-0001"
        location = "South Africa North"
    }
    "rg2_uat" = {
        name     = "rg2-uat-0002"
        location = "South Africa North"
    }
}

subnet = {
    "subnet1" = {
        name            = "subnet-uat-0001"
        address_prefixes = ["10.0.1.0/24"]
        resource_group_name  = "rg1-uat-0001"    
        }
    "subnet2" = {
        name            = "AzureBastionSubnet"
        address_prefixes = ["10.0.2.0/24"]
        resource_group_name  = "rg1-uat-0001"    
        }
    "subnet3" = {
        name                = "ApplicationGatewaySubnet"
        address_prefixes    = ["10.0.3.0/24"]
        resource_group_name = "rg1-uat-0001"
}    
}

pip = {
    "pip1" = {
        pip_name            = "pip-uat-lb-0001"
        location            = "South Africa North"
        resource_group_name = "rg1-uat-0001"    
        }
    "pip2" = {
        pip_name            = "pip-uat-bastion-0002"
        location            = "South Africa North"
        resource_group_name = "rg1-uat-0001"    
        }
    "pip3" = {
        pip_name            = "pip-uat-appgw-0001"
        location            = "South Africa North"
        resource_group_name = "rg1-uat-0001"    
        }
}

nic = {
  "vm1" = {
    nic_name            = "nic-uat-vm-0001"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    subnet_name         = "subnet-uat-0001"
    virtual_network_name = "vnet-uat-0001"
  }

  "vm2" = {
    nic_name            = "nic-uat-vm-0002"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    subnet_name         = "subnet-uat-0001"
    virtual_network_name = "vnet-uat-0001"
  }
}

virtual_machine = {
  "vm1" = {
    vm_name             = "vm-uat-0001"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    vm_size             = "Standard_B1s"
    image_publisher     = "Canonical"
    image_offer         = "UbuntuServer"
    image_sku           = "18.04-LTS"
  }

  "vm2" = {
    vm_name             = "vm-uat-0002"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    vm_size             = "Standard_B1s"
    image_publisher     = "Canonical"
    image_offer         = "UbuntuServer"
    image_sku           = "18.04-LTS"
  }
}

sqldb = {
    "sqldb1" = {
        db_name    = "sqldb-uat-0001"
        collation  = "SQL_Latin1_General_CP1_CI_AS"
        max_size_gb = 2
        sku_name   = "Basic"
    }
}

web_app = {
    "webapp1" = {
        app_name            = "webapp-uat-0001"
        location            = "South Africa North"
        resource_group_name = "rg1-uat-0001"
        linux_fx_version    = "NODE|18-lts"
    }
    
}