FROM debian:buster

RUN apt-get update && apt-get -y install -y \
	wget \
	nginx \
	openssl \
	mariadb-server \
	mariadb-client \
	gettext-base \
	php7.3 \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	php-curl \
	php-intl \ 
	php-zip \ 
	php-xml \
	php-xmlrpc \
	php-soap 

ENV auto_index=on

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz

RUN wget https://wordpress.org/latest.tar.gz

ADD srcs/ init_c/

CMD ./init_c/init.sh

#docker rmi my_image
#docker build -t my_image .

#By default autoindex is on
#docker run --rm --name my_container -it -p 8080:80 -p 443:443 my_image
#docker run --rm --name my_container -it -e auto_index=off p 8080:80 -p 443:443 my_image
