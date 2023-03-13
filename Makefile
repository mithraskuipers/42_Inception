
# "hostsed add" adds an entry to the local /etc/hosts file. It maps the IP address 127.0.0.1 to the hostname mikuiper.42.fr.
# The docker compose command starts the containers defined in the ./srcs/docker-compose.yml file.
# "-f" specifies the location of the Compose file.
# "-d" detaches the containers from the console, allowing them to run in the background.
all:
	@sudo hostsed add 127.0.0.1 mikuiper.42.fr
	sudo docker compose -f ./srcs/docker-compose.yml up -d

# The docker compose command stops and removes all containers, networks, and volumes that are defined in the /srcs/docker-compose.yml file.
# "--rmi all" removes all images associated with the containers.
# "-v" removes any anonymous volumes created by the containers.
clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v

# "docker system" refers to the Docker system, including all its components and resources
# "prune" is the command that removes unused resources. It deletes stopped contains, dangling images, and unused networks and volumes.
# "-a" specifies that ALL unused resources should be removed, as opposed to only some of them.
ffclean: fclean
	sudo docker system prune -a

fclean: clean
	@sudo hostsed rm 127.0.0.1 mikuiper.42.fr
	sudo rm -rf /home/mikuiper/docker_container_volumes/wordpress/*
	sudo rm -rf /home/mikuiper/docker_container_volumes/mariadb/*

re: fclean all

ls:
	sudo docker image ls
	sudo docker ps

.PHONY: all, clean, fclean, re, ls

