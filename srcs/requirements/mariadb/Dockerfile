# Dockerfile for setting up a Debian Buster-based image with MariaDB and modified configuration for network connectivity.

# The code sets up a Docker image based on the Debian Buster distribution.
# The system is updated and upgraded using apt-get.
# MariaDB server, MariaDB client, and the nano text editor are installed using apt-get.
# The setup_mariadb.sh script is copied to the temporary directory /tmp/.
# The setup_mariadb.sh script is made executable using chmod.
# The MariaDB configuration file located at /etc/mysql/mariadb.conf.d/50-server.cnf is modified to allow connections from any IP address by replacing the bind-address setting.
# The "skip-networking" option in the configuration file is uncommented to enable network connections.
# The entrypoint for the Docker image is set to execute the setup_mariadb.sh script.

# Base image
FROM debian:buster

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install MariaDB server and client, as well as nano text editor
RUN apt-get install -y mariadb-server mariadb-client nano

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
