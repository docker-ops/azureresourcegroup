resource "azurerm_resource_group" "hcl-cus-rsg-d-network" {
    name     = "myResourceGroup"
    location = "uswest"

    tags = {
        environment = "Terraform"
    }
}
resource "azurerm_virtual_network" "hcl-cus-vnet-d-01" {
    name                = "myVnet"
    address_space       = ["11.0.0.0/22"]
    location            = "uswest"
    resource_group_name = azurerm_resource_group.myterraformgroup.name

    tags = {
        environment = "Terraform"
    }
}
resource "azurerm_subnet" "hcl-cus-snt-d-aks" {
    name                 = "mySubnet1"
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["11.0.0.0/24"]
}
resource "azurerm_subnet" "hcl-cus-snt-d-aag" {
    name                 = "mySubnet2"
    resource_group_name  = azurerm_resource_group.myterraformgroup.name
    virtual_network_name = azurerm_virtual_network.myterraformnetwork.name
    address_prefixes       = ["11.0.1.0/24"]
}
