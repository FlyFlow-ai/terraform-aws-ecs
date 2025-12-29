# ECS Service
data "aws_ecs_cluster" "main" {
  cluster_name = var.cluster_name
}
resource "aws_ecs_service" "service" {
  name            = var.ecs_service_name
  cluster         = data.aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.desired_count
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.http_listener]
}