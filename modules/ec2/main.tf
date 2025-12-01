data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Configure EC2 instance in a public subnet
resource "aws_instance" "ec2_public" {
  ami = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = true
  instance_type = "t3.micro"
  key_name = var.key_name
  subnet_id = var.public_subnets[0]
  vpc_security_group_ids = [var.sg_pub_id]
  #user_data = file("install_wordpress.sh")
  # User data file
  user_data = templatefile("install_wordpress.sh.tpl", {
    DB_HOST     = var.db_instance_address
    DB_PORT = var.db_instance_port
    DB_USER     = var.db_user
    DB_PASSWORD = var.db_password
    WORDPRESS_DIR = "/var/www/html" 
    DB_NAME="wordpress_db"
  })

  tags = {
    "Name" = "${var.namespace}-EC2-PUBLIC"
  }
}