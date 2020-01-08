variable "wordpress_db_user" {
  description = "maps to module.db.db_username"
}

variable "wordpress_db_name" {
  description = "maps to module.db.db_name"
}

variable "wordpress_db_password" {
  description = "maps to var.db_password from prompt"
}

variable "db_host" {
  description = "maps to module.db.db_address"
}

variable "vpc_cluster_id" {
  description = "The ID of the ECS cluster the service will be in"
}

variable "alb_tg_arn" {
  description = "The ARN of the ALB target group for the ECS service"
}

variable "proxy_target" {
  description = "The target host that nginx will proxy to"
  default = "wordpress"
}