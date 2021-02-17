#!/bin/bash

mkdir /var/www/ft_server

#---set up nginx---    
#remplace default par notre propre config + update liens symboliques
service nginx start
mv ./init_c/nginx_config /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
#---------------end


#---Configure SQL via mariaDB //skip password? ask adrien
service mysql start
echo "CREATE DATABASE db_wordpress;"| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON db_wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
#------------------------end

#---Activate PHP
service php7.3-fpm start
mkdir /var/www/ft_server/phpMyAdmin
tar -xzf phpMyAdmin-5.0.1-english.tar.gz --strip-components 1 -C /var/www/ft_server/phpMyAdmin
rm phpMyAdmin-5.0.1-english.tar.gz
mv ./init_c/config.inc.php /var/www/ft_server/phpMyAdmin
rm /var/www/ft_server/phpMyAdmin/config.sample.inc.php

#------------end

#---WordPress 
mkdir /var/www/ft_server/wordpress
tar -xvzf latest.tar.gz --strip-components 1 -C /var/www/ft_server/wordpress
rm latest.tar.gz
mv ./init_c/wp-config.php /var/www/ft_server/wordpress
rm /var/www/ft_server/wordpress/wp-config-sample.php
#--------end

#---SSL Certificate settings
openssl req -x509 -nodes -days 365 -subj "/C=US/ST=Illinois/L=Chicago/O=Pineapple_inc/OU=IT/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.pem;
chmod -R 755 /var/www/*
#------------------------end

#---Reload nginx to have the update config
service nginx reload

#------------------------------------end
#open bash to prevent container from closing
bash
