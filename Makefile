#lol

all:
	mkdir -p /home/kscordel/data/mariadb
	mkdir -p /home/kscordel/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
#	docker network rm inception

fclean: clean
	sudo rm -rf /home/kscordel/data/mariadb/*
	sudo rm -rf /home/kscordel/data/wordpress/*
	docker volume rm srcs_mariadb
	docker volume rm srcs_wordpress
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean