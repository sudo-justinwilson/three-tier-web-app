module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "three-tier-vpc"
  cidr   = "10.0.0.0/16"
  azs = var.availability_zones

  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]



  enable_nat_gateway = true
  #enable_vpn_gateway = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

  enable_dns_hostnames = true

  tags = {
    Name        = "three-tier-vpc"
    Terraform   = "true"
    Environment = "dev"

  }

}

module "ecs-cluster" {
  source              = "./modules/ecs-cluster"
  security_groups     = module.vpc.default_security_group_id
  vpc_zone_identifier = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
}

module "database" {
  source = "./modules/db"
  database_subnet       = module.vpc.database_subnets[0]
  database_subnet_group = module.vpc.database_subnet_group

  db_security_group_ids = [module.ecs-cluster.three-tier-sg-id, module.vpc.default_security_group_id]

  db_username = var.db_username
  db_password = var.db_password
}

module "alb" {
  source                = "./modules/alb"
  vpc_security_group_id = module.vpc.default_security_group_id
  vpc_public_subnets    = module.vpc.public_subnets
  vpc_id                = module.vpc.vpc_id
}

module "service" {
  source = "./modules/service"

  wordpress_db_user = var.db_username
  wordpress_db_name = module.database.db_name
  # supplied at terraform apply prompt
  wordpress_db_password = var.db_password

  db_host = module.database.db_address
  vpc_cluster_id = module.ecs-cluster.cluster_id
  alb_tg_arn = module.alb.alb_tg_arn
}