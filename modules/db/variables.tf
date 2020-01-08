variable "database_subnet" {
  description = "subnet that RDS will be launched in"
}

variable "database_subnet_group" {
  description = "subnet group that RDS will be launched in"
}

variable "db_security_group_ids" {
  description = "database security group IDs"
}

variable "db_username" {
  description = "database username"
}

variable "db_password" {
  description = "database username"
}
