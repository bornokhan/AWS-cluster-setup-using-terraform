module "vpc" {
  source = "./modules/1_vpc"
}

module "subnet" {
  source = "./modules/02_Subnet"
  vpc_id = module.vpc.vpc_id
}

module "IGW" {
  source = "./modules/03_IGW"
  vpc_id = module.vpc.vpc_id
}

module "4_Nat-Gatway-with-Elastic-IP" {
  source = "./modules/4_Nat-Gatway-with-Elastic-IP"
  #vpc_id = module.vpc.vpc_id
  pub_sub_id = module.subnet.pub_sub_id
}

module "RT" {
  source = "./modules/5_RT"
  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  ngw_id = module.ngw.ngw_id
}

module "subnet_association" {
  source      = "./modules/6_subnet_association"
  pub_sub_id  = module.subnet.pub_sub_id
  pub_rt_id   = module.route_table.pub_rt_id
  pvt_sub1_id = module.subnet.pvt_sub1_id
  pvt_sub2_id = module.subnet.pvt_sub2_id
  pvt_sub3_id = module.subnet.pvt_sub3_id
  pvt_rt_id   = module.route_table.pvt_rt_id
}

module "SGs" {
  source = "./modules/7_SGs"
  vpc_id = module.vpc.vpc_id
}

module "key-pair" {
  source = "./modules/8_key-pair"
  public_key = file("./ssh/aws_cluster_key.pub")
}

module "Instances" {
  source                 = "./modules/9_Instances"
  pub_sub_id             = module.subnet.pub_sub_id
  pvt_sub1_id            = module.subnet.pvt_sub1_id
  pvt_sub2_id            = module.subnet.pvt_sub2_id
  pvt_sub3_id            = module.subnet.pvt_sub3_id
  bastion_sg_id          = module.security_group.bastion_sg_id
  master-node_sg_id     = module.security_group.master-node_sg_id
  aws_cluster_keypair_id = module.keypair.aws_cluster_keypair_id
}