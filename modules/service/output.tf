output "task_definition_arn" {
  value = aws_ecs_task_definition.three-tier.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.three-tier.family
}

output "task_definition_revision" {
  value = aws_ecs_task_definition.three-tier.revision
}
  
output "ecs_service_arn" {
  value = aws_ecs_service.three-tier-service.id
}

output "ecs_desired_count" {
  value = aws_ecs_service.three-tier-service.desired_count
  description = "The desired count of the ECS service"
}
