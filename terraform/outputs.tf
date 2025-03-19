
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = module.ecs_cluster.ecs_cluster_id
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.ecs_cluster.alb_dns_name
}
