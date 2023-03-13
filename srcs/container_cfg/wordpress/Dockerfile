FROM debian:buster

# Expose port 9000 to other containers (not to host)
EXPOSE 9000

# Install required packages
RUN apt-get update && apt-get install -y \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-client \
	curl && \
	rm -rf /var/lib/apt/lists/*

# Copy custom PHP-FPM pool configuration
COPY ./cfg/www.conf /etc/php/7.3/fpm/pool.d

# Download and extract latest WordPress version to /var/www/
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

# Install WP-CLI tool to /usr/bin/wp
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent
RUN chmod +x ./usr/bin/wp

# Create a directory for the PHP-FPM socket file
RUN mkdir /run/php

# Copy custom configuration script and make it executable
COPY ./cfg/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

# Set the command to run the configuration script when container starts
CMD ["bash", "/var/www/wordpress/config.sh"]
