output "db_address" {
  value = aws_db_instance.db.address
  description = "The address of the database"
}

output "db_port" {
  value = aws_db_instance.db.port
  description = "The port of the database"
}

output "db_name" {
  value = aws_db_instance.db.name
  description = "The name of the database"
}

output "db_status" {
  value = aws_db_instance.db.status
  description = "The status of the database"
}

output "db_username" {
  value = aws_db_instance.db.username
  description = "The DB username"
}

output "db_id" {
  value = aws_db_instance.db.id
  description = "The DB ID"
}