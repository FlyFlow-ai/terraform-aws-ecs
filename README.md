# terraform-aws-ecs-service

Terraform module to deploy an **AWS ECS Fargate service behind an Application Load Balancer**
using an **existing VPC and subnets**.

This module is designed to be **Terraform Registry compatible**, reusable across environments,
and safe to version using semantic versioning.

---

## Usage

```hcl
module "ecs_service" {
  source  = "flyflow/ecs/aws"
  version = "~> 1.0"

  vpc_id            = "vpc-123456"
  subnet_ids        = ["subnet-aaa", "subnet-bbb"]
  desired_count     = 2

  cluster_name      = "prod-cluster"
  ecs_service_name  = "api-service"
  task_family       = "api-task"

  cpu               = 512
  memory            = 1024

  container_name    = "api"
  container_port    = 8080

  alb_name          = "api-alb"
  target_group_name = "api-tg"

  container_definitions = jsonencode([
    {
      name  = "api"
      image = "nginx:latest"
      portMappings = [
        {
          containerPort = 8080
        }
      ]
    }
  ])
}
```

---

## Inputs

| Name | Description | Type | Required |
|------|------------|------|----------|
| vpc_id | ID of the existing VPC | string | yes |
| subnet_ids | List of subnet IDs where ECS tasks will run | list(string) | yes |
| desired_count | Desired number of ECS tasks | number | yes |
| cluster_name | ECS cluster name | string | yes |
| ecs_service_name | ECS service name | string | yes |
| task_family | ECS task definition family name | string | yes |
| cpu | CPU units for the task definition | number | yes |
| memory | Memory (MiB) for the task definition | number | yes |
| container_definitions | JSON-encoded container definitions | string | yes |
| container_name | Primary container name | string | yes |
| container_port | Container port exposed to the load balancer | number | yes |
| target_group_name | ALB target group name | string | yes |
| alb_name | Application Load Balancer name | string | yes |

---

## Outputs

| Name | Description |
|------|-------------|
| ecs_service_name | Name of the ECS service |
| task_definition_arn | ARN of the ECS task definition |

---

## Requirements

- Terraform >= 1.3
- AWS Provider >= 5.0

---

## Notes

- This module assumes an **existing VPC, subnets, and ALB**
- No `provider` or `backend` blocks are defined (by design)
- Suitable for Terraform Registry publishing

---

## License

MIT
