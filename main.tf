provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "./modules/resource_group"
  name   = "resourcegroup"
  location = "East US"
}

module "storage_account" {
  source = "./modules/storage_account"
  name   = "storageacc"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
}

module "public_ip" {
  source = "./modules/public_ip"
  name   = "publicIP"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
}

module "virtual_network" {
  source = "./modules/virtual_network"
  name   = "vnet"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
}

module "subnet" {
  source = "./modules/subnet"
  name   = "subnet"
  resource_group_name = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  location = module.resource_group.location
}

module "application_gateway" {
  source = "./modules/application_gateway"
  name   = "applicationgw"
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  public_ip_id = module.public_ip.id
  subnet_id = module.subnet.id
}
