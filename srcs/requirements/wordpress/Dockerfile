FROM debian:bullseye-slim

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y wget

RUN apt-get install -y php7.4 php-fpm php-mysql
	
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
	
RUN apt-get upgrade -y
RUN	apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.4.2-fr_FR.tar.gz \
	&& rm /var/www/html/wordpress-6.4.2-fr_FR.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/set_wordpress.sh ./set_wordpress.sh
RUN chmod +x ./set_wordpress.sh

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["bash", "/set_wordpress.sh"]