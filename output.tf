output "private_subnets" {
  value = "${module.vpc.private_subnets}"
}

output "nat_public_ips" {
  value = "${module.vpc.nat_public_ips}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "vpc_main_route_table_id" {
  value = "${module.vpc.vpc_main_route_table_id}"
}

output "private_route_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}

output "vpc_igw_id" {
  value = "${module.vpc.igw_id}"
}

output "vpc_nat_ids" {
  value = "${module.vpc.nat_ids}"
}

output "default_security_group_id" {
  value = "${module.vpc.default_security_group_id}"
}

output "database_subnets" {
  value = "${module.vpc.database_subnets}"
}

output "database_subnet_group" {
  value = "${module.vpc.database_subnet_group}"
}

output "cluster_id" {
  value = "${module.ecs-cluster.cluster_id}"
  depends_on = [
    module.vpc.default_security_group_id,
  ]
}

output "cluster_arn" {
  value = "${module.ecs-cluster.cluster_arn}"
  depends_on = [
    module.vpc.default_security_group_id,
  ]
}

output "asg_name" {
  value = "${module.ecs-cluster.asg_name}"
  depends_on = [
    module.vpc.default_security_group_id,
    module.vpc.private_subnets,
  ]
}

output "db_address" {
  value       = module.database.db_address
  description = "The address of the database"
  depends_on = [
    module.vpc.default_security_group_id,
    module.vpc.private_subnets,
  ]
}

output "db_port" {
  value       = module.database.db_port
  description = "The port of the database"
  depends_on = [
    module.vpc.default_security_group_id,
    module.vpc.private_subnets,
  ]
}

output "db_name" {
  value       = module.database.db_name
  description = "The name of the database"
  depends_on = [
    module.vpc.default_security_group_id,
    module.vpc.private_subnets,
  ]
}

output "db_status" {
  value       = module.database.db_status
  description = "The status of the database"
}

#####   ALB ####
output "alb_tg_arn" {
  value       = module.alb.alb_tg_arn
  description = "The ARN of the ALB target group"
}

output "alb_tg_id" {
  value       = module.alb.alb_tg_id
  description = "The ID of the ALB target group"
}

output "alb_tg_name" {
  value       = module.alb.alb_tg_name
  description = "The name of the ALB target group"
}

output "alb_id" {
  value       = module.alb.alb_id
  description = "The ID of the ALB"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The ID of the ALB"
}

output "alb_listener_arn" {
  value       = module.alb.alb_listener_arn
  description = "The ARN of the ALB listener"
}

output "alb_listener_id" {
  value       = module.alb.alb_listener_id
  description = "The ID of the ALB listener"
}

###---  TASK DEFINITION ---###
output "task_definition_arn" {
  value       = module.service.task_definition_arn
}

output "task_definition_family" {
  value       = module.service.task_definition_family
}

output "task_definition_revision" {
  value       = module.service.task_definition_revision
}

#####   ECS SERVICE ####
output "ecs_service_arn" { 
  value       = module.service.ecs_service_arn
  description = "The ARN of the ECS service"
}

output "ecs_desired_count" {
  value       = module.service.ecs_desired_count
  description = "The desired count of the ECS service"
}
