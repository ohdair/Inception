all : up

# sudo date -s "$$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
up :
	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/database
	sudo docker-compose -f srcs/docker-compose.yml up -d --build
	sudo cp -rp ./srcs/requirements/nginx/conf/hosts /etc/hosts
	sudo chmod 777 /etc/hosts

down :
	sudo docker-compose -f srcs/docker-compose.yml down

fdown :
	sudo docker stop $$(sudo docker ps -a -q)
	sudo docker rm $$(sudo docker ps -a -q)
	sudo docker rmi -f $$(sudo docker images -q)
	sudo docker system prune -f
	sudo rm -rf ${HOME}/data /etc/hosts

ps :
	sudo docker-compose -f srcs/docker-compose.yml ps

stop_wp :
	sudo docker stop c_wordpress
	sudo docker rm c_wordpress
	sudo docker rmi -f wordpress
	sudo rm -rf ${HOME}/data/wordpress

exec_db :
	sudo docker exec -it c_mariadb bash

exec_wp :
	sudo docker exec -it c_wordpress bash

exec_nx :
	sudo docker exec -it c_nginx bash

log_db :
	sudo docker logs -t c_mariadb

log_nx :
	sudo docker logs -t c_nginx

log_wp :
	sudo docker logs -t c_wordpress

# NAME = Inception

# all:	$(NAME)

# $(NAME):
# 	sudo mkdir -p ${HOME}/data/wordpress ${HOME}/data/database
# 	docker-compose -f srcs/docker-compose.yml up --build -d

# up:
# 	docker-compose -f srcs/docker-compose.yml up -d

# down:
# 	docker-compose -f srcs/docker-compose.yml down

# clean:
# 	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

# .PHONY: all up down clean