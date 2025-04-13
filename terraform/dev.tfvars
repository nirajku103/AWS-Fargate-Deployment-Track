
region = "eu-west-1"
vpc_cidr_block = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
public_subnet_azs = ["eu-west-1a", "eu-west-1c"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
private_subnet_azs = ["eu-west-1a", "eu-west-1c"]

cluster_name = "dev-ecs-cluster"

service1_cpu = "256"
service1_memory = "512"
service1_container_port = 3001
service1_desired_count = 1

service2_cpu = "256"
service2_memory = "512"
service2_container_port = 3000
service2_desired_count = 1
