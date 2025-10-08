module "javarg" {
  source           = "./modules/resource_group"
  application_name = var.application_name
  location         = var.location
}

module "network" {
  source           = "./modules/network"
  application_name = var.application_name
  location         = var.location
  rg_name          = module.javarg.rg_name
  java_cidr        = var.java_cidr
  java_sub_cidr    = var.java_sub_cidr
}

module "vm" {
  source           = "./modules/vm"
  application_name = var.application_name
  location         = var.location
  rg_name          = module.javarg.rg_name
  subnet_id        = module.network.subnet_id
  public_ip_id     = module.network.public_ip_id
  vm_size          = var.vm_size
  vm_username      = var.vm_username
  vm_pass          = var.vm_pass
 #ssh_public_key_path = var.ssh_public_key_path
 ssh_public_key = file("${path.root}/publickey.pub")
   
}
