resource "aws_db_instance" "db" {
  allocated_storage    = 20
	max_allocated_storage = 50
  db_subnet_group_name = var.database_subnet_group
  vpc_security_group_ids  = var.db_security_group_ids
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "three_tier"
  username             = var.db_username
  password             = var.db_password
  # if we don't set skip_final_snapshot to true, terraform destroy fails:
  skip_final_snapshot   = true
}
