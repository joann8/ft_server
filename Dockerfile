FROM debian:buster

RUN apt-get update && apt-get -y install -y \
	wget \
	nginx \
	mariadb-server \
	php7.3 \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	openssl \
	php-curl \
	php-intl \ 
	php-zip \ 
	php-xml \
	php-soap 
 
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz

RUN wget https://wordpress.org/latest.tar.gz

ADD srcs/ init_c/

CMD ./init_c/init.sh
