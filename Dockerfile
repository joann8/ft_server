FROM debian:buster

RUN apt-get update && apt-get -y install -y \
	wget \
	nginx \
	openssl \
	mariadb-server \
	php-curl \
	php-mysql \
	php-fpm \
	php-gd \
	php-mbstring \
	php-intl \ 
	php-zip \ 
	php-xml \
	php-xmlrpc \
	php-soap 

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

RUN wget https://wordpress.org/latest.tar.gz

ADD srcs/ init_c/

ENV	AUTOINDEX=on;

CMD ./init_c/init.sh

#docker rmi my_image
#docker build -t my_image .

#By default autoindex is on
#docker run --rm --name my_container -it -p 80:80 -p 443:443 my_image
#docker run --rm --name my_container -it -e auto_index=off p 80:80 -p 443:443 my_image
