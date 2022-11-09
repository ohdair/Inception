NAME = Inception

all:	$(NAME)

$(NAME):
	mkdir -p /home/jaewpark/data/mariadb/
	mkdir -p /home/jaewpark/data/wordpress/
	cp ./srcs/requirements/nginx/conf/hosts /etc/hosts
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

fclean: clean
	rm -rf /home/jaewpark/data/mariadb/* /home/jaewpark/data/wordpress/*

re: fclean all

.PHONY: all down clean fclean re