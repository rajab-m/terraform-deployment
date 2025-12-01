
variable "rds_admin" {
  description = "The admin for the RDS instance"
  type        = string
  sensitive   = true
}

variable "rds_password" {
  description = "The password for the RDS instance"
  type        = string
  sensitive   = true
}

# deployment environment
variable "namespace" {
  type = string
}

# security group id for the rds
variable "vpc_sg_ids" {
  type = any
}

# security group id for the rds
variable "subnet_group" {
  type = any
}