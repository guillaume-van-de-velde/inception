all:
	mkdir -p /home/sabri/mariadb /home/sabri/wordpress && docker-compose -f srcs/docker-compose.yml build && docker-compose -f srcs/docker-compose.yml up

remove:
	docker system prune -af --volumes && docker network prune && rm -rf /home/sabri/mariadb /home/sabri/wordpress