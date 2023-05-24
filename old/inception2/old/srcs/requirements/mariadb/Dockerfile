# This Dockerfile is used to build a MariaDB container based on Alpine Linux 3.16. It starts by defining build-time arguments for the database name, username, and password. The Dockerfile then updates the package index and installs MariaDB and its client libraries. It creates a directory for the MySQL socket and sets appropriate permissions. A new configuration file called "docker.cnf" is created in the "/etc/my.cnf.d/" directory to specify the bind address as 0.0.0.0, allowing connections from any IP address. Networking is enabled in the main MariaDB config file by replacing "skip-networking" with "skip-networking=0". The MySQL data directory is initialized, and port 3306 is exposed to allow incoming connections. The Dockerfile copies a database initialization script and runs it. Finally, it switches to the MySQL user and starts the server with the "--skip-log-error" flag.

# Use Alpine 3.16 as the base image
FROM alpine:3.16

# Define build-time arguments
# These are arguments whose values can be specified during the build process.
# E.g. docker build --build-arg DB_NAME=mydb --build-arg DB_USER=myuser etc...
ARG DB_NAME \
    DB_USER \
    DB_PASS

# Update the package index and install MariaDB and client libraries.
RUN apk update && apk add --no-cache mariadb mariadb-client

# Create the directory for the MySQL socket and set permissions.
RUN mkdir /var/run/mysqld && chmod 777 /var/run/mysqld

# Create a new configuration file called "docker.cnf" inside the "/etc/my.cnf.d/" directory.
# The configuration will be provided through the echo commands within the shell script.
# Start of the [mysqld] section in the cfg file. And set bind address to listen on all network interfaces.

# When the bind address is set to 0.0.0.0, the MySQL server will bind to all available network
# interfaces, including the loopback interface (127.0.0.1) and any network interfaces associated
# with the host system (e.g., Ethernet, Wi-Fi). This allows clients from any IP address to connect # to the MySQL server.

RUN echo '[mysqld]' > /etc/my.cnf.d/docker.cnf \ 
    && echo 'bind-address=0.0.0.0' >> /etc/my.cnf.d/docker.cnf 

# Enable networking in the main MariaDB config file
# Use sed to replace the occurrence of "skip-networking" with "skip-networking=0" in the mariadb server.cnf file
RUN sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf

# Initialize the MySQL data directory.
# Specify user named 'mysql' under which the initialization process should run. This user is typically used. Also specify data directory where MySQL stores its data files. /var/lib/mysql is commonly used for storing MySQL data.
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Expose port 3306 for incoming connections
# This is the default port used by the MariaDB server for client connections.
# By exposing it, you allow external applications to connect with the MariaDB instance.
EXPOSE 3306

# Copy the database initialization script and run it
COPY requirements/mariadb/conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh

# Switch to the user MySQL and start the server
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
