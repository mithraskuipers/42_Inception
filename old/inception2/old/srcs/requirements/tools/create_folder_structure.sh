# This Bash script creates a directory structure for a project called "inception". It creates various directories and files within the project directory, including Makefile, .env, docker-compose.yml, Dockerfiles, configuration files, and tools directories. The script uses the $USER environment variable to determine the user's home directory.

#!/bin/bash

mkdir /home/$USER/inception ;
mkdir /home/$USER/inception/srcs ;
touch /home/$USER/inception/Makefile ;
touch /home/$USER/inception/srcs/.env ;
touch /home/$USER/inception/srcs/docker-compose.yml ;
mkdir -p /home/$USER/inception/srcs/requirements/mariadb/conf ;
mkdir -p /home/$USER/inception/srcs/requirements/tools ;
touch /home/$USER/inception/srcs/requirements/mariadb/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/mariadb/conf/create_db.sh ;
mkdir -p /home/$USER/inception/srcs/requirements/nginx/conf ;
touch /home/$USER/inception/srcs/requirements/nginx/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/nginx/conf/nginx.conf ;
mkdir -p /home/$USER/inception/srcs/requirements/wordpress/conf ;
touch /home/$USER/inception/srcs/requirements/wordpress/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/wordpress/conf/wp-config-create.sh ;
touch /home/$USER/inception/srcs/requirements/mariadb/.dockerignore ;
touch /home/$USER/inception/srcs/requirements/wordpress/.dockerignore ;
mkdir -p /home/$USER/inception/srcs/requirements/mariadb/tools ;
touch /home/$USER/inception/srcs/requirements/mariadb/tools/.gitkeep ;
mkdir -p /home/$USER/inception/srcs/requirements/wordpress/tools ;
touch /home/$USER/inception/srcs/requirements/wordpress/tools/.gitkeep ;
mkdir /home/$USER/inception/srcs/requirements/nginx/tools/ ;
