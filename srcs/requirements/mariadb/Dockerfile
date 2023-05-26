# Dockerfile for setting up a Debian Buster-based image with MariaDB and modified configuration for network connectivity.

# The code sets up a Docker image based on the Debian Buster distribution.
# Updates and upgrades the system using apt-get update and apt-get upgrade -y.
# Installs the MariaDB server and client using apt-get install -y mariadb-server mariadb-client.
# Copies the setup_mariadb.sh script to the /tmp/ directory using the COPY command.
# Makes the setup_mariadb.sh script executable using chmod +x /tmp/setup_mariadb.sh.
# Modifies the MariaDB configuration file located at /etc/mysql/mariadb.conf.d/50-server.cnf to allow connections from any IP address by replacing the bind-address setting.
# Uncomment the "skip-networking" option in the configuration file to enable network connections.
# Sets the entrypoint for the Docker image to execute the setup_mariadb.sh script.

# Base image
FROM debian:buster

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install MariaDB server and client
RUN apt-get install -y mariadb-server mariadb-client

# Copy setup_mariadb.sh to the temporary directory
COPY tools/setup_mariadb.sh /tmp/

# Make setup_mariadb.sh executable
RUN chmod +x /tmp/setup_mariadb.sh

# Modify the MariaDB configuration file to allow connections from any IP address
RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf

# Uncomment the "skip-networking" option in the configuration file
RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 

# Set the entrypoint to setup_mariadb.sh
ENTRYPOINT ["/tmp/setup_mariadb.sh"]
