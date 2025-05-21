module "compute" {
  source = "./modules/compute"
  instance_ami        = var.instance_ami
  public_subnet_id    = module.network.public-subnets[0]
  private_subnet_id   = module.network.private-subnets[0]
  bastion_sg          = module.security.bastion_sg_id
  app_sg              = module.security.app_sg_id
  public_ec2_name     = var.public_ec2_name
  private_ec2_name    = var.private_ec2_name
  instance_type       = var.instance_type
}
module "network" {
  source = "./modules/network"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  internet_gw_name = var.internet_gw_name
  nat_gw_name = var.nat_gw_name
  public_route_table_name = var.public_route_table_name
  private_route_table_name = var.private_route_table_name
}
module "load_balancer" {
  source = "./modules/load_balancer"
  lb_name = var.load_balancer_name
  lb_sg_id = module.security.lb_sg_id
  public_subnet_ids = module.network.public-subnets
  vpc_id = module.network.vpc-id
  instance_id = module.compute.app_instance_id
}
module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc-id  
}
