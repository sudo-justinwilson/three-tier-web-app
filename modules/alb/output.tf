output "alb_tg_arn" {
  value       = aws_alb_target_group.three-tier-target-group.arn
  description = "The ARN of the ALB target group"
}

output "alb_tg_id" {
  value       = aws_alb_target_group.three-tier-target-group.id
  description = "The ID of the ALB target group"
}

output "alb_tg_name" {
  value       = aws_alb_target_group.three-tier-target-group.name
  description = "The name of the ALB target group"
}

output "alb_id" {
  value       = aws_lb.three-tier-alb.id
  description = "The ID of the ALB"
}

output "alb_dns_name" {
  value       = aws_lb.three-tier-alb.dns_name
  description = "The ID of the ALB"
}

output "alb_listener_arn" {
  value       = aws_alb_listener.alb-listener.arn
  description = "The ARN of the ALB listener"
}

output "alb_listener_id" {
  value       = aws_alb_listener.alb-listener.id
  description = "The ID of the ALB listener"
}