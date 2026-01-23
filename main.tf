module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                     = var.vpc_cidr
  public_subnet_cidr           = var.public_subnet_cidr
  private_db_subnet_cidr       = var.private_db_subnet_cidr
  private_monitoring_subnet_cidr = var.private_monitoring_subnet_cidr
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  instance_type               = var.instance_type
  key_name                    = var.key_name
  public_subnet_id            = module.vpc.public_subnet_id
  private_db_subnet_id        = module.vpc.private_db_subnet_id
  private_monitoring_subnet_id = module.vpc.private_monitoring_subnet_id
  public_sg_id                = module.security_groups.public_sg_id
  private_sg_id               = module.security_groups.private_sg_id
}