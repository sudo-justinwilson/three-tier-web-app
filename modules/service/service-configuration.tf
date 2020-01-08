resource "aws_ecs_service" "three-tier-service" {
  name     = "three-tier-service"
  iam_role = aws_iam_role.ecs-service-role.name
  cluster         = var.vpc_cluster_id

  task_definition = aws_ecs_task_definition.three-tier.arn
  desired_count   = 2

  load_balancer {
    target_group_arn = var.alb_tg_arn
    container_port   = 80
    container_name = "nginx"
  }
}
