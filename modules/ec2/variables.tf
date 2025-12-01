# deployment environment
variable "namespace" {
  type = string
  
}
# VPC
variable "public_subnets" {
  type = any
}
# key pair used
variable key_name {
  type = string
  
}
# public security group id
variable "sg_pub_id" {
  type = any
}

variable "db_user" {
  description = "The admin for the sql database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the sql database"
  type        = string
  sensitive   = true
}

variable "db_instance_address" {
  description = "The db endpoint dns"
  type        = any
}

variable "db_instance_port" {
  description = "The db port"
  type        = any
}
