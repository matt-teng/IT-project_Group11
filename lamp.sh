# Assignment 1 Shell Script - Group 11

# Update System
sudo apt-get update -y
sudo apt-get upgrade -y

#Enable ports 
ufw enable -y
ufw allow 22 -y
ufw allow 3306 -y

# Install Apache
sudo apt-get install apache2 apache2-doc apache2-utils -y

#Install mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin' -y
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin' -y
sudo apt-get install mysql-server -y


#install PHP
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y
sudo systemctl restart apache2
