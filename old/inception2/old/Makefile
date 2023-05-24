# Project Name
NAME = inception

# Default Target
all: inception_splash create_certs
	@echo "Launching configuration $(NAME)..."
	@if [ ! -d "/home/${USER}/data" ]; then \
		mkdir ~/data; \
		mkdir ~/data/mariadb; \
		mkdir ~/data/wordpress; \
	fi
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d
	@echo "Running all $(NAME) docker containers 🐋"

# Build Target
build: create_certs
	@echo "Building configuration $(NAME)..."
	@if [ ! -d "/home/${USER}/data" ]; then \
		mkdir ~/data; \
		mkdir ~/data/mariadb; \
		mkdir ~/data/wordpress; \
	fi
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

# Down Target
down:
	@echo "Stopping configuration $(NAME)..."
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

# Rebuild Target
re: fclean all

# Clean Target
clean: down
	@echo "Cleaning configuration $(NAME)..."
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@bash srcs/requirements/tools/remove_certificates.sh

# Full Clean Target
fclean: down
	@echo "Total clean of all configurations Docker"
	@docker stop $$(docker ps -qa) 2> /dev/null || true
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@bash srcs/requirements/tools/remove_certificates.sh

# Certificate Creation Target
create_certs:
	@bash srcs/requirements/tools/create_certificates.sh

inception_splash:
	@echo "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo "by Mithras Kuipers                                                  \n";

.PHONY: all build down re clean fclean create_certs inception_splash
