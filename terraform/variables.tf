variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The public subnets for the VPC"
  type        = list(string)
}

variable "public_subnet_azs" {
  description = "The Availability Zones for the public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets for the VPC"
  type        = list(string)
}

variable "private_subnet_azs" {
  description = "The Availability Zones for the private subnets"
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}


variable "service1_image" {
  description = "The Docker image for service 1"
  type        = string
}

variable "service1_cpu" {
  description = "The amount of CPU to allocate to service 1"
  type        = string
}

variable "service1_memory" {
  description = "The amount of memory to allocate to service 1"
  type        = string
}

variable "service1_container_port" {
  description = "The container port for service 1"
  type        = number
}

variable "service1_desired_count" {
  description = "The desired number of tasks for service 1"
  type        = number
}

variable "service2_image" {
  description = "The Docker image for service 2"
  type        = string
}

variable "service2_cpu" {
  description = "The amount of CPU to allocate to service 2"
  type        = string
}

variable "service2_memory" {
  description = "The amount of memory to allocate to service 2"
  type        = string
}

variable "service2_container_port" {
  description = "The container port for service 2"
  type        = number
}

variable "service2_desired_count" {
  description = "The desired number of tasks for service 2"
  type        = number
}