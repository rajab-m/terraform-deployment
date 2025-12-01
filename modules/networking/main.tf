# dynamically retrieves availability zones
data "aws_availability_zones" "available" {}  # the provider will determine the regionof the query

# call the vpc module to be imported with the terraform init command, the module link provides documentation on the vpc module "terraform-aws-modules/vpc/aws".
module "vpc" {
  source = "terraform-aws-modules/vpc/aws" #path from registry .if it were local we would have written "./terraform-aws-modules/vpc/aws"
  #source = "./terraform-aws-vpc/terraform-aws-vpc-master"
  name = "${var.namespace}-vpc"
  cidr = "10.0.0.0/16"
  azs = data.aws_availability_zones.available.names
  private_subnets  = ["10.0.1.0/24"]  # i don't need it but the code won't work without it, i don't know
  database_subnets = ["10.0.2.0/24", "10.0.3.0/24"]   # DB subnets
  public_subnets = ["10.0.101.0/24"]
  #assign_generated_ipv6_cidr_block = true
  create_database_subnet_group = true

  enable_dns_support   = true
  enable_dns_hostnames = true
  create_igw = true
   
  enable_nat_gateway = false
  #single_nat_gateway = true

  tags = {
  "Name" = "${var.namespace}-vpc"
  }

}



resource "aws_security_group" "allow_ssh_http_https" {
  name        = "${var.namespace}-allow_ssh_http_https"
  description = "Allow incoming SSH, HTTP and HTTPS traffic"
  vpc_id      = module.vpc.vpc_id

  # SSH
  ingress {
    description = "SSH from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    description = "HTTPS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.namespace}-allow_ssh_http_https"
  }
}

# security group for the sql database
resource "aws_security_group" "rds_sg" {
  name        = "${var.namespace}-rds-sg"
  description = "Allow MySQL traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # restrict this in production!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




