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

# Copy the wp_setup.sh script to the container
COPY tools/wp_setup.sh .

# Make wp_setup.sh executable
RUN chmod +x wp_setup.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Set the entrypoint to run wp_setup.sh
ENTRYPOINT ["./wp_setup.sh"]
