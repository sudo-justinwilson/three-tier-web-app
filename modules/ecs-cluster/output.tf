output "cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
  depends_on = [
    module.vpc.default_security_group_id,
  ]
}

output "cluster_arn" {
  value = aws_ecs_cluster.ecs_cluster.arn
  depends_on = [
    module.vpc.default_security_group_id,
  ]
}

output "asg_name" {
  value = aws_autoscaling_group.ecs-autoscaling-group.name
}

output "three-tier-sg-arn" {
  value = aws_security_group.three-tier-sg.arn
}

output "three-tier-sg-id" {
  value = aws_security_group.three-tier-sg.id
}

output "three-tier-sg-name" {
  value = aws_security_group.three-tier-sg.name
}
