# Set the project name
PROJECT = inception

# Get a list of all containers
LIST_CONTAINERS := $(shell docker ps -a -q)

# Get a list of all volumes
LIST_VOLUMES := $(shell docker volume ls -q)

# Default target: create directories and start the services
all: inception_splash
	# Create directories for data storage
	mkdir -p /home/mikuiper/data/mariadb
	mkdir -p /home/mikuiper/data/wordpress
	# Start the services using docker-compose in detached mode
	docker-compose -f srcs/docker-compose.yml up --build -d --remove-orphans
	@echo "Your website is running!"
	@echo "You can now use the terminal."

# Stop and kill the services
kill:
	# Stop the services
	docker-compose -f srcs/docker-compose.yml stop
	# Kill the services
	docker-compose -f srcs/docker-compose.yml kill

# Clean up the environment
clean:
	# Stop and remove the services
	docker-compose -f srcs/docker-compose.yml down
	# Remove data directories
	sudo rm -rf /home/mikuiper/data/
	# Stop, kill, and remove all containers
	docker stop $$(docker ps -aq) 2>/dev/null && \
	docker kill $$(docker ps -aq) 2>/dev/null && \
	docker rm -f $$(docker ps -aq) 2>/dev/null || true
	# Prune images, volumes, and networks
	docker image prune -a --force --filter "until=24h" 2>/dev/null && \
	docker volume prune --force 2>/dev/null && \
	docker network prune --force 2>/dev/null || true

# MariaDB options menu
maria:
	@echo "Select an option:"
	@echo "1. Show MariaDB databases"
	@echo "2. Show MariaDB logs"
	@read -p "Enter your choice: " choice; \
	case $$choice in \
	1) make maria-show;; \
	2) make maria-logs;; \
	*) echo "Invalid option. Please try again.";; \
	esac

# Show MariaDB databases
maria-show:
	@docker exec -it mariadb bash -c "mysql -u root -p -e 'SHOW DATABASES;'"

# Show MariaDB logs
maria-logs:
	@docker logs mariadb

# WordPress options menu
wp:
	@echo "Select an option:"
	@echo "1. Show wp docker"
	@echo "2. Show wp logs"
	@read -p "Enter your choice: " choice; \
	case $$choice in \
	1) make wp-docker;; \
	2) make wp-logs;; \
	*) echo "Invalid option. Please try again.";; \
	esac

# Show WordPress containers
wp-docker:
	@docker ps -a | grep wordpress

# Show WordPress logs
wp-logs:
	@docker logs wordpress

inception_splash:
	@echo "██╗███╗   ██╗ ██████╗███████╗██████╗ ████████╗██╗ ██████╗ ███╗   ██╗"
	@echo "██║████╗  ██║██╔════╝██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║"
	@echo "██║██╔██╗ ██║██║     █████╗  ██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║"
	@echo "██║██║╚██╗██║██║     ██╔══╝  ██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║"
	@echo "██║██║ ╚████║╚██████╗███████╗██║        ██║   ██║╚██████╔╝██║ ╚████║"
	@echo "╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝"
	@echo "by Mithras Kuipers                                                  \n";
