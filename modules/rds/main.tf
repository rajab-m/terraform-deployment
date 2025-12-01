# create db instance, by default it will use at least two subnets to provide High availability

resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.rds_admin
  password             = var.rds_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = var.vpc_sg_ids

  db_subnet_group_name   = var.subnet_group
  publicly_accessible    = false # optional if you want EC2 outside VPC
 tags = {
    Name       = "${var.namespace}-db"
 }

}


