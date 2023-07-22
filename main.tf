provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source = "./modules/vpc"
  availability_zones_count = var.availability_zones_count
}

module "eks" {
  source = "./modules/eks"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets
  private_subnet_id = module.vpc.private_subnets
  cluster_name =  module.eks.cluster_name

}

module "private_docker_registry" {
  source = "./modules/ecr"
  name = var.ecr_name
}

module "mysql" {
  source = "./modules/mysql"
  db-sg-id = module.vpc.db_sg_id
}
