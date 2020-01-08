resource "aws_autoscaling_group" "ecs-autoscaling-group" {
  name     = "three-tier_ecs-autoscaling-group"

  max_size = 2
  min_size = 1
  desired_capacity = var.desired_capacity
  launch_configuration = aws_launch_configuration.ecs-launch-configuration.name
  health_check_type    = "ELB"
  vpc_zone_identifier = var.vpc_zone_identifier
}
