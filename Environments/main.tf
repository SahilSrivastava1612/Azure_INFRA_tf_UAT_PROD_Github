module "resource_group" {
    source = "../Child_Modules/azurerm_resource_groups"
    resource_groups = var.resource_group
}

module "storage_account" {
    source = "../Child_Modules/azurerm_storage_accounts"
    depends_on = [ module.resource_group ]
    storage_account_name = "stuat0001"
    resource_group_name  = "rg2-uat-0002"
    location             = "South Africa North"
    account_tier         = "Standard"
    account_replication_type = "LRS" 
}

module "key_vault" {
    source = "../Child_Modules/azurerm_key_vaults"
    depends_on = [ module.resource_group ]
    key_vault_name      = "kv-uat-0001"
    resource_group_name = "rg2-uat-0002"
    location            = "South Africa North"
    sku_name            = "standard"
    soft_delete_retention_days = 7
    key_permissions     = ["Get", "List", "Create", "Delete", "Recover" ]
    secret_permissions  = ["Get", "List", "Set", "Delete", "Recover" ]
    certificate_permissions = ["Get", "List", "Create", "Delete", "Recover" ]
    username            = "AzureAdmin"
    password            = "P@ssw0rd!"
}

module "virtual_network" {
    source = "../Child_Modules/azurerm_virtual_networks"
    depends_on = [ module.resource_group ]
    virtual_network_name = "vnet-uat-0001"
    address_space        = ["10.0.0.0/16"]
    location             = "South Africa North"
    resource_group_name  = "rg1-uat-0001"
    subnets              = var.subnet
    }

module "nsg" {
    source = "../Child_Modules/azurerm_networks_security_groups"
    depends_on = [ module.resource_group ]
    nsg_block_name      = "nsg-uat-0001"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
}

module "subnet_nsg_association" {
    source = "../Child_Modules/azurerm_subnet_nsg_association"
    depends_on = [ module.virtual_network, module.nsg ]
    nsg_block_name        = "nsg-uat-0001"
    resource_group_name   = "rg1-uat-0001"
    virtual_network_name  = "vnet-uat-0001"
    subnet_name           = "subnet-uat-0001"
}

module "public_ip" {
    source = "../Child_Modules/azurerm_public_IPs"
    depends_on = [ module.resource_group ]
    public_ips = var.pip
}

module "bastion" {
    source = "../Child_Modules/azurerm_bastion"
    depends_on = [ module.resource_group, module.public_ip, module.virtual_network ]
    bastion_name        = "bastion-uat-0001"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    subnet_name         = "AzureBastionSubnet"
    vnet_name           = "vnet-uat-0001"
    public_ip_name     = "pip-uat-bastion-0002"
}

module "virtual_machines" {
    source = "../Child_Modules/azurerm_virtual_machines"
    depends_on = [ module.resource_group, module.virtual_network, module.nsg, module.subnet_nsg_association, module.key_vault ]
    virtual_machine = var.vm
    virtual_machines = var.virtual_machine
    key_vault_name = "kv-uat-0001"
    key_vault_rg   = "rg2-uat-0002"
    subnet_name = "subnet-uat-0001"
    virtual_network_name = "vnet-uat-0001"
    resource_group_name  = "rg1-uat-0001"
    rg_name = "rg1-uat-0001"
}

module "sql_servers" {
    source = "../Child_Modules/azurerm_sql_servers"
    depends_on = [ module.resource_group, module.key_vault ]
    sql_server_name     = "sql-uat-0001"
    resource_group_name = "rg1-uat-0001"
    location            = "South Africa North"
    sql_server_version  = "12.0"
    key_vault_name      = "kv-uat-0001"
    key_vault_rg        = "rg2-uat-0002"
}

module "sql_databases" {
    source = "../Child_Modules/azurerm_sql_databases"
    depends_on = [ module.sql_servers ]
    sql_databases = var.sqldb
    rg = "rg2-uat-0002"
    sqlservername     = "sql-uat-0001"
}

module "web_apps" {
    source = "../Child_Modules/azurerm_web_apps"
    depends_on = [ module.resource_group]
    location            = "South Africa North"
    resource_group_name = "rg2-uat-0002"
    web_apps = var.web_app
}

module "acr" {
    source = "../Child_Modules/azurerm_container_registry"
    depends_on = [ module.resource_group ]
    acr_name            = "acruat0001"
    resource_group_name = "rg1-uat-0001"
    location            = "South Africa North"
}

module "aks" {
    source = "../Child_Modules/azurerm_kubernetes_cluster"
    depends_on = [ module.resource_group, module.acr ]
    cluster_name        = "aks-uat-0001"
    location            = "South Africa North"
    resource_group_name = "rg1-uat-0001"
    dns_prefix          = "aksuat0001"
    acr_name            = "acruat0001"
    acr_resource_group_name = "rg1-uat-0001"
}

module "load_balancer" {
    source = "../Child_Modules/azurerm_load_balancer"
    depends_on = [ module.resource_group, module.public_ip, module.virtual_machines ]
    load_balancer_name            = "lb-uat-0001"
    location                      = "South Africa North"
    resource_group_name           = "rg1-uat-0001"
    public_ip_name                = "pip-uat-lb-0001"
    frontend_ip_configuration_name = "LoadBalancerFrontEnd"
    backend_pool_name             = "LoadBalancerBackEndPool"
    lb_health_probe_name          = "HealthProbe"
    lb_health_probe_port          = 80
    nic_name                      = "nic-uat-vm-0001"
    nic_name2                     = "nic-uat-vm-0002"
}

