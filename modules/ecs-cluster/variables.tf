variable "min_instance_size" {
  description = "minimum size of the instance"
  default     = 1
}

variable "max_instance_size" {
  description = "Max instance state"
  default     = 2
}

variable "ecs_cluster" {
  description = "The ecs cluster to use"
  default = "three-tier_ecs_cluster"
}


variable "ecs_key_pair_name" {
  description = "The key pair to use"
  default = "new_aws_keys"
}


variable "desired_capacity" {
  description = "desired capacity for autoscaling group"
  default     = 1
}

variable "ecs_instance_type" {
  description = "the size of the EC2 instance to use"
  #default     = "t2.micro"
  default     = "t2.small"
}

variable "security_groups" {
  description = "The security group to use for the launch config"
}

variable "vpc_zone_identifier" {
  description = "The subnets the launch config uses"
}

variable "vpc_id" {
  description = "The subnets the launch config uses"
}
