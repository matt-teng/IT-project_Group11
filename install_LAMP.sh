
#!/bin/sh
# Assignment 1 Shell Script - Group 11
echo "================================================="
echo "System Update, Apache2, MySQL & PHP installing ......"
echo "================================================="
# Update System
sudo apt-get update -y
sudo apt-get upgrade -y

#Enable ports 
ufw enable -y
ufw allow 22 -y
ufw allow 3306 -y

echo "================================================="
echo "Apache2 Installing ........"
echo "================================================="

# Install Apache
sudo apt-get install apache2 apache2-doc apache2-utils -y

echo "================================================="
echo "mySQL Installing ........"
echo "================================================="

#Install mysql
echo "mysql-server mysql-server/admin-user string root" | debconf-set-selections
echo "mysql-server mysql-server/root_password password admin" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password admin" | debconf-set-selections
sudo apt-get install mysql-server -y

echo "================================================="
echo "PHP Installing ........"
echo "================================================="

#install PHP
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y
sudo apt-get install aspell graphviz php7.0-curl php7.0-gd php7.0-intl php7.0-ldap php7.0-mysql php7.0-pspell php7.0-xml php7.0-xmlrpc php7.0-zip -y


#Modifying permissions 
sudo chmod 777 /var/www/html/

echo "================================================="
echo "Moodle Installing ................."
echo "================================================="

#restart the system to load the modules
sudo systemctl restart apache2 

# Download the moodle
curl -L https://download.moodle.org/download.php/direct/stable32/moodle-latest-32.tgz > moodle.tgz
sudo tar -xvzf moodle.tgz -C /var/www/html 
sudo mkdir /var/www/moodledata 
sudo chown -R www-data /var/www/moodledata/ 
sudo chmod -R 777 /var/www/moodledata 
sudo chmod -R 0755 /var/www/html/moodle

#change the mysqlDatabase configuration file
gedit /etc/mysql/mysql.conf.d/mysqld.cnf
defult_storage_engine = innodb
innodb_file_per_table = 1
innodb_file_format = Barracuda

# log in the mysql
sudo -S mysql -u root -padmin <<EOF
CREATE DATABASE moodle DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci; 
create user 'moodler'@'localhost' IDENTIFIED BY 'moodlerpassword'; 
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,CREATE TEMPORARY TABLES,DROP,INDEX,ALTER ON moodle.* TO 'moodler'@'localhost' IDENTIFIED BY 'moodlerpassword';
exit

EOF

sudo chmod -R 777 /var/www/html/moodle 
echo "================================================="
echo "Moodle Installed"
echo "================================================="

# ip=`curl ifconfig.co`
# sudo -u www-data /usr/bin/php /var/www/html/moodle/admin/cli/install.php --chmod=777 --lang=en --wwwroot=http://$ip/moodle --dataroot=/var/www/moodledata --dbtype=mysqli \
# --dbhost=localhost --dbname=moodle --dbuser=moodler --dbpass=moodlerpassword --dbport=22 --prefix=mdl_ --fullname=Group11-2018 --shortname=G11 --adminuser=admin --adminpass=password --non-interactive --allow-unstable --agree-license
