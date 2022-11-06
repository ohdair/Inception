NAME = Inception
UNAME	:= $(shell uname -s)
ifeq ($(UNAME),Darwin)	#macOS
	DB_PATH		:= ./data
	HOST_LINK	:=
else					#Linux
	DB_PATH		:= /home/jisokang/data
	HOST_LINK	:= "127.0.0.1	jisokang.42.fr" > /etc/hosts
endif

all:	$(NAME)

$(NAME):
	mkdir -p $(DB_PATH)/mariadb/ $(DB_PATH)/wordpress/
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

fclean: clean
	rm -rf /Users/bagjaeu/Inception/data/*
# rm -rf $(DB_PATH)/mariadb/* $(DB_PATH)/wordpress/*

re: fclean all

.PHONY: all down clean fclean re