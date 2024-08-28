all:
	mkdir -p /home/mariadb /home/wordpress && docker compose -f srcs/docker-compose.yml up --build

remove:
	docker system prune -af --volumes && docker network prune && rm -rf /home/mariadb /home/wordpress