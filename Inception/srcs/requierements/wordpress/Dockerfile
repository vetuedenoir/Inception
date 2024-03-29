From debian:bullseye-slim

RUN apt-update -y && apt install -y \
	wget \
	php8.3 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN apt upgrade -y

RUN wget https://wordpress.org/latest.zip -P /var/www
RUN cd /var/www && tar -xvf latest.zip && rm -rf latest.zip && cd /
RUN chown -R www-data:www-data /var/www/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp/wp-cli.phar

EXPOSE 9000

COPY conf/www.conf /etc/php/8.3/fpm/pool.d/www.conf

COPY tools/set_wordpress.sh ./set_wordpress.sh
RUN chmod +x ./set_wordpress.sh

ENTRYPOINT ["bash", "./set_wordpress.sh"]


