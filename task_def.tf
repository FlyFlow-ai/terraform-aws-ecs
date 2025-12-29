# ECS Task Definition
resource "aws_ecs_task_definition" "task" {
  family                   = var.task_family
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = var.container_definitions
}