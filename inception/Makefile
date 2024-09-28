all:
	mkdir -p /home/svan-de-/data/mariadb /home/svan-de-/data/wordpress && docker compose -f srcs/docker-compose.yml up --build

remove:
	docker system prune -af --volumes && docker volume rm srcs_mariadb srcs_wordpress && rm -rf /home/svan-de-/data