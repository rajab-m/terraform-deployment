variable "namespace" {
  description = "The project namespace to be used for the unique naming of resources"
  default     = "Rajab-dev"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "eu-west-3"
  type        = string
}

# key pair used
variable "key_name" {
  type    = string
  default = "Rajab-datascientest_keypair"

}

variable "access_key" {
  description = "Access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "secret key"
  type        = string
  sensitive   = true
}

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
