#!/bin/bash

# Variables provided by Terraform
DB_HOST="${DB_HOST}"
DB_USER="${DB_USER}"
DB_PASSWORD="${DB_PASSWORD}"
WORDPRESS_DIR="${WORDPRESS_DIR}"
DB_NAME="${DB_NAME}"
DB_PORT="${DB_PORT}"
# Update system
sudo yum update -y

# Enable Amazon Linux extras for PHP 8.2 (or 8.1)
sudo amazon-linux-extras enable php8.2 -y
sudo yum clean metadata

# Install Apache HTTP server
sudo yum install -y httpd wget php-fpm php-mysqli php-json php php-devel mysql

# Start Apache &  Enable Apache to start on boot
sudo systemctl start httpd && sudo systemctl enable httpd
sudo usermod -a -G apache ec2-user
# Create a PHP info page
sudo chown -R ec2-user:apache /var/www/html/
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
echo "" > /var/www/html/phpinfo.php

# Install required PHP modules
sudo yum install php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap} -y

# Download WordPress
cd /home/ec2-user
# Download the latest WordPress
wget https://wordpress.org/latest.zip

# Unzip the WordPress archive
unzip latest.zip

# Move WordPress files to Apache's web directory
mv wordpress/* ${WORDPRESS_DIR}

# Change ownership of the web directory
sudo chown -R ec2-user:apache ${WORDPRESS_DIR}

# Create DB on RDS
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASSWORD" \
    -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Configure WordPress
cd ${WORDPRESS_DIR}
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sed -i "s/username_here/$DB_USER/" wp-config.php
sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
sed -i "s/localhost/$DB_HOST/" wp-config.php

# Permissions
sudo find ${WORDPRESS_DIR} -type d -exec chmod 755 {} \;
sudo find ${WORDPRESS_DIR} -type f -exec chmod 644 {} \;

sudo systemctl restart httpd

echo "***************************************************************"
echo "****  WordPress installation completed successfully!       ****"
echo "***************************************************************"
