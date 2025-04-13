provider "aws" {
  region = var.region
}

# OIDC Provider for GitHub
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
    
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1" # GitHub's OIDC thumbprint
  ]
}

# IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" : "repo:nirajku103/AWS-Fargate-Deployment-Track:ref:refs/heads/main"
          }
        }
      }
    ]
  })
}



# Attach Policies to the IAM Role
resource "aws_iam_role_policy_attachment" "github_actions_ecr" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
}

resource "aws_iam_role_policy_attachment" "github_actions_terraform" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # Adjust this to least privilege
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
