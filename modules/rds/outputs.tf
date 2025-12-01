output "db_instance_identifier" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.my_db_instance.identifier
}

output "db_instance_endpoint" {
  description = "The RDS endpoint for connecting to the database"
  value       = aws_db_instance.my_db_instance.endpoint
}

output "db_instance_port" {
  description = "The port for the RDS instance"
  value       = aws_db_instance.my_db_instance.port
}

output "db_instance_address" {
  description = "The DNS address of the RDS instance"
  value       = aws_db_instance.my_db_instance.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.my_db_instance.arn
}

output "db_subnet_group_name" {
  description = "The DB subnet group used by this RDS instance"
  value       = aws_db_instance.my_db_instance.db_subnet_group_name
}

output "db_security_group_ids" {
  description = "List of security group IDs attached to this RDS instance"
  value       = aws_db_instance.my_db_instance.vpc_security_group_ids
}


