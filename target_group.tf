# Target Group
resource "aws_lb_target_group" "ecs_tg" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path                = "/"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}