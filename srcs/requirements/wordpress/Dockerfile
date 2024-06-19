FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade

RUN apt-get install -y wget

RUN apt-get install -y php7.3 php-fpm 	php-mysql
	
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
	
RUN apt-get upgrade -y
RUN	apt-get install -y default-mysql-client \
	mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzvf latest.tar.gz && rm -rf latest.tar.gz && cd /
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/set_wordpress.sh ./
RUN chmod +x ./set_wordpress.sh

ENTRYPOINT ["bash", "./set_wordpress.sh"]