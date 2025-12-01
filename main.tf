provider "aws" {
  region     = "eu-west-3"
  access_key = var.access_key
  secret_key = var.secret_key
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }
}
# call networking module
module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}
# call ec2 module
module "ec2" {
  source               = "./modules/ec2"
  namespace            = var.namespace
  db_user              = var.db_user
  db_password          = var.db_password
  db_instance_address = module.rds.db_instance_address
  db_instance_port     = module.rds.db_instance_port
  public_subnets       = module.networking.public_subnets
  sg_pub_id            = module.networking.sg_pub_id
  key_name             = var.key_name

}

module "ebs" {
  source            = "./modules/ebs"
  namespace         = var.namespace
  instance_id       = module.ec2.instance_id # pass EC2 output here, we can't pass module inside a module but only from the root
  availability_zone = module.ec2.ec2_az      # same AZ as EC2, we must first expose the az using outputs in ec2 module
}

module "rds" {
  source       = "./modules/rds"
  namespace    = var.namespace
  rds_admin    = var.rds_admin
  rds_password = var.rds_password
  vpc_sg_ids   = [module.networking.rds_sg_id]          # attach SG
  subnet_group = module.networking.db_subnet_group_name # everything needs to be referred here MUST be in the output file inside the module itself

}