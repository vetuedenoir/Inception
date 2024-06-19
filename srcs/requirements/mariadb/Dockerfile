FROM debian:bullseye-slim

RUN	apt-get update && apt install -y \
	mariadb-server \
	mariadb-client \
	procps

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	mkdir -p /var/run/mysqld
RUN	mkdir -p /var/lib/mysql
RUN	chown mysql:mysql /var/run/mysqld/
RUN	chmod -R 755 /var/run/mysqld/
RUN	chown mysql:mysql /var/lib/mysql/
RUN	chmod -R 755 /var/lib/mysql/

EXPOSE	3306

COPY	./tools/db_init_script.sh ./
RUN		chmod +x ./db_init_script.sh

ENTRYPOINT ["bash", "./db_init_script.sh"]