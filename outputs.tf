output "db_subnet_group_name" {
  description = "Database subnet group name from RDS module"
  value       = module.rds.db_subnet_group_name
}

output "db_instance_endpoint" {
  description = "Database subnet group name from RDS module"
  value       = module.rds.db_instance_endpoint
}