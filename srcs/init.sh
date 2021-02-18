#!/bin/bash

####START LEMP####

mkdir /var/www/ft_server

#---set up nginx---    
#remplace default par notre propre config + update liens symboliques
service nginx start
mv ./init_c/nginx_config /etc/nginx/sites-available/ft_server
ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
#---------------end

#---Configure SQL via mariaDB 
service mysql start
echo "CREATE DATABASE wordpress_database;" | mysql -u root
echo "GRANT ALL ON wordpress_database.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;"| mysql -u root
#------------------------end

#---Activate PHP
service php7.3-fpm start
#------------end

####END LEMP####


####START SETUP####

#---WordPress 
mkdir /var/www/ft_server/wordpress
tar -xzf latest.tar.gz --strip-components 1 -C /var/www/ft_server/wordpress
rm latest.tar.gz
mv /init_c/wp-config.php /var/www/ft_server/wordpress
#ajout de mon contenu 
mysql -u root < init_c/localsite.sql
mkdir -p /var/www/ft_server/wordpress/wp-content/uploads/2021/02
mv /init_c/giphy.gif /var/www/ft_server/wordpress/wp-content/uploads/2021/02/
#--------end

#----Php
mkdir /var/www/ft_server/phpMyAdmin
tar -xzf phpMyAdmin-latest-all-languages.tar.gz --strip-components 1 -C /var/www/ft_server/phpMyAdmin
rm phpMyAdmin-latest-all-languages.tar.gz
mv ./init_c/config.inc.php /var/www/ft_server/phpMyAdmin
#---end

#---SSL Certificate settings
mkdir -p /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 \
	-keyout /etc/ssl/ft_server.key -out /etc/ssl/ft_server.pem \
	-nodes -days 365 \
	-subj "/C=FR/ST=Valdoise/L=Margency/O=Pineapple_inc/OU=IT/CN=localhost"
#------------------------end

####END SETUP###

#---Autoindex script
./init_c/autoindex.sh

#---Reload nginx to have the update config
service nginx reload

#---open bash to prevent container from closing
bash
