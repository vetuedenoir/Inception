From debian:bullseye-slim

RUN apt update && apt install -y \
	wget \
	php-fpm \
	php-mysql \
	mariadb-client \
	unzip

RUN	apt-get update && apt-get install -y gnupg2
RUN  apt install -y \
	software-properties-common lsb-release apt-transport-https ca-certificates

RUN	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

RUN	wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN	apt-get update -y

RUN apt install php8.3 -y

RUN apt upgrade -y

RUN wget https://wordpress.org/latest.zip -P /var/www
RUN cd /var/www && unzip latest.zip && rm -rf latest.zip && cd /
RUN chown -R www-data:www-data /var/www/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY conf/www.conf /etc/php/8.3/fpm/pool.d/www.conf

COPY tools/set_wordpress.sh ./set_wordpress.sh
RUN chmod +x ./set_wordpress.sh

ENTRYPOINT ["bash", "./set_wordpress.sh"]
