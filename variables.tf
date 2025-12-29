# Accept existing VPC and Subnets as input
variable "vpc_id" {
  description = "ID of the existing VPC"
}

variable "subnet_ids" {
  description = "List of subnet IDs in the VPC"
  type        = list(string)
}
variable "desired_count" {
  type        = number
  description = "Desired count of instances"
}
variable "cluster_name" {
  type        = string
  description = "The cluster name used for ECS "
}
variable "ecs_service_name" {
  type = string
  description = "Ecs service name in cluster"
}
variable "task_family" {}
variable "cpu" {}
variable "memory" {}
variable "container_definitions" {}
variable "container_name" {}
variable "container_port" {}
variable "target_group_name" {}
variable "alb_name" {}