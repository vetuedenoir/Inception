FROM debian:bullseye-slim

RUN	apt-get update && apt install -y \
		nginx	\
		curl
#		vim	\
#		systemctl

RUN	mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl	
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=kscordel.42.fr/UID=kscordel"

RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/
RUN chown -R www-data:www-data /var/www/

RUN chmod -R 755 /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

CMD [ "nginx", "-g", "daemon off;" ]


