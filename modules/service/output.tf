output "task_definition_arn" {
  value = aws_ecs_task_definition.three-tier.arn
}

output "task_definition_family" {
  value = aws_ecs_task_definition.three-tier.family
}

output "task_definition_revision" {
  value = aws_ecs_task_definition.three-tier.revision
}
