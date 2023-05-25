# Dockerfile for setting up a WordPress environment with PHP-FPM and MariaDB client.

# Base image: Debian Buster
# Update package repositories to ensure the latest versions are available.
# Install PHP-FPM, PHP MySQL extension, Wget, and MariaDB client for WordPress functionality.
# Download WP-CLI, a command-line tool for managing WordPress installations.
# Make WP-CLI executable to run it as a command.
# Move WP-CLI to the bin directory for global accessibility.
# Configure PHP-FPM to listen on port 9000, enabling communication with other services.
# Create a directory to store the PHP-FPM socket for communication.
# Copy the setup_wordpress.sh script to the container for WordPress setup and configuration.
# Make the setup_wordpress.sh script executable to run it as a command.
# Expose port 9000 to allow external access to the PHP-FPM service.
# Set the entrypoint to run the setup_wordpress.sh script, initializing WordPress setup.

FROM debian:buster

# Update package repositories
RUN apt-get update

# Install PHP-FPM, PHP MySQL extension, Wget, and MariaDB client
RUN apt-get install -y php-fpm php-mysql wget mariadb-client

# Download WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Make WP-CLI executable
RUN chmod u+x wp-cli.phar

# Move WP-CLI to the bin directory
RUN mv wp-cli.phar /usr/local/bin/wp

# Configure PHP-FPM to listen on port 9000
RUN sed 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/7.3/fpm/pool.d/www.conf

# Create directory for PHP-FPM socket
RUN mkdir -p /run/php

# Copy the setup_wordpress.sh script to the container
COPY tools/setup_wordpress.sh .

# Make setup_wordpress.sh executable
RUN chmod +x setup_wordpress.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entrypoint to run setup_wordpress.sh
ENTRYPOINT ["./setup_wordpress.sh"]
