# Use the Debian Buster base image
FROM debian:buster

# Expose the MariaDB port 3306 to other containers but not to the host
EXPOSE 3306

# Set build-time arguments for database name, username, and passwords
ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

# Update package list and install MariaDB server
RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*

# Remove the default 50-server.cnf file and replace it with a custom configuration file
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY cfg/50-server.cnf /etc/mysql/mariadb.conf.d

# Copy the adduser.sh script to the container and run it to add a new database user
COPY tools/adduser.sh /
RUN bash ./adduser.sh

# Remove the adduser.sh script from the container
RUN rm -rf adduser.sh

# Start MariaDB server in safe mode
CMD ["mysqld_safe"]

# Instructions for testing database connectivity
# These commands can be run from within the container using "docker exec" command
# sudo docker exec -it mariadb mariadb --user mikuiper -proot
# SHOW DATABASES;
# USE wordpress;
# SHOW TABLES
