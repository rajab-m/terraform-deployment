output "vpc" {
  value = module.vpc
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "sg_pub_id" {
  value = aws_security_group.allow_ssh_http_https.id
}

output "rds_sg_id" {
  description = "Security group ID for the RDS instance"
  value       = aws_security_group.rds_sg.id
}

output "db_subnet_group_name" {
  description = "The name of the database subnet group created by the VPC module"
  value       = module.vpc.database_subnet_group_name
}






