provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block    = var.vpc_cidr_block
  public_subnets    = var.public_subnets
  public_subnet_azs = var.public_subnet_azs
  private_subnets   = var.private_subnets
  private_subnet_azs = var.private_subnet_azs
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  region                = var.region
  cluster_name          = var.cluster_name
  service1_image        = var.service1_image
  service1_cpu          = var.service1_cpu
  service1_memory       = var.service1_memory
  service1_container_port = var.service1_container_port
  service1_desired_count = var.service1_desired_count
  service2_image        = var.service2_image
  service2_cpu          = var.service2_cpu
  service2_memory       = var.service2_memory
  service2_container_port = var.service2_container_port
  service2_desired_count = var.service2_desired_count
  subnets               = module.vpc.public_subnets
#  security_groups       = var.security_groups
#  alb_security_groups   = var.alb_security_groups
  vpc_id                = module.vpc.vpc_id
}