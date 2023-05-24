# This Dockerfile starts with an Alpine Linux image with PHP installed. It adds a DNS server to resolve potential DNS resolution problems. The file defines build arguments, including the PHP version and database credentials. The package repositories are updated, and necessary packages, including PHP extensions and tools, are installed. The PHP-FPM configuration is modified to listen on all interfaces and run as the "nobody" user. APK cache is cleaned up. The working directory is set to /var/www. The latest version of WordPress is downloaded, extracted, and copied to the working directory. A script is copied to the container to create the wp-config.php file, which is executed and then removed. The wp-content/ directory permissions are set to be writable. Finally, the command is set to start PHP-FPM in foreground mode.

# Start from a lightweight Alpine Linux image with PHP installed
FROM alpine:3.16

# Add DNS server. Added because I ran into some temporary DNS resolution problems.
RUN grep -qxF 'nameserver 8.8.8.8' /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# Define some build arguments (these can be set with --build-arg when building the image)
ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS

# Update the package repositories and install necessary packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    wget \
    unzip && \

# Change PHP-FPM configuration to listen on all interfaces
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \

# Change PHP-FPM configuration to run as nobody:nobody
# Done by means of uncommenting these lines in the www.conf file.
# Done to avoid security issues. By default, PHP-FPM creates the socket with root ownership and group.
# This means that any user that can access the socket can run commands as root.
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.mode = 0660|listen.mode = 0660|g" /etc/php8/php-fpm.d/www.conf && \

# Clean up APK cache
    rm -f /var/cache/apk/*

# Set the working directory to /var/www
WORKDIR /var/www

# Download and extract the latest version of Wordpress
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# Copy the wp-config-create.sh script to the container and run it to create wp-config.php
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && \
    rm wp-config-create.sh && \

# Make wp-content/ writable
    chmod -R 0777 wp-content/

# Set the command to start PHP-FPM in foreground mode
CMD ["/usr/sbin/php-fpm8", "-F"]
