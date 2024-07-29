module "my_vpc" {
  source            = "./modules/vpc"
  environment_name  = var.environment_name
  knox_id           = var.knox_id
  gbl-tags          = var.gbl-tags
  vpc_cidr          = var.vpc_cidr
  private_subnet_1  = var.private_subnet_1
  private_subnet_2  = var.private_subnet_2
  public_subnet_1   = var.public_subnet_1
  public_subnet_2   = var.public_subnet_2
}

module "my_alb" {
  source               = "./modules/alb"
  environment_name     = var.environment_name
  knox_id              = var.knox_id
  gbl-tags             = var.gbl-tags
  addtl-tags           = var.addtl-tags
  skillup_sg_id        = var.skillup_sg_id
  skillup_bastion_host = var.skillup_bastion_host
  private_sg_id        = module.my_asg.private_sg_id
  myvpc_id             = module.my_vpc.vpc_id
  public_sub_1         = module.my_vpc.public_sub_1
  public_sub_2         = module.my_vpc.public_sub_2
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_pair             = var.key_pair
}

module "my_asg" {
  source            = "./modules/asg"
  environment_name  = var.environment_name
  knox_id           = var.knox_id
  gbl-tags          = var.gbl-tags
  addtl-tags        = var.addtl-tags
  bastion_sg_id     = module.my_alb.bastion_sg_id
  alb_sg_id         = module.my_alb.alb_sg_id
  myvpc_id          = module.my_vpc.vpc_id
  private_sub_1     = module.my_vpc.private_sub_1
  private_sub_2     = module.my_vpc.private_sub_2
  tg_arn            = module.my_alb.tg_arn
  s3_endpoint       = module.my_vpc.s3_endpoint
}
