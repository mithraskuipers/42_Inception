#!/bin/sh

# Check if wp-config.php file exists
if [ ! -f "/var/www/wp-config.php" ]; then

    # Create the wp-config.php file
    cat << EOF > /var/www/wp-config.php
<?php

// MariaDB configuration
define( 'DB_NAME', '$DB_NAME' );
define( 'DB_USER', '$DB_USER' );
define( 'DB_PASSWORD', '$DB_PASS' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

wp core download --allow-root
wp config create --dbname=\$DB_NAME --dbuser=\$DB_USER --dbpass=\$DB_PASS --dbhost=\$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=\$DOMAIN_NAME/wordpress --title=\$WP_TITLE --admin_user=\$WP_ADMIN_USR --admin_password=\$WP_ADMIN_PWD --admin_email=\$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create \$WP_USR \$WP_EMAIL --role=author --user_pass=\$WP_PWD --allow-root
wp theme install inspiro --activate --allow-root


// Filesystem method
define('FS_METHOD','direct');

// Table prefix
\$table_prefix = 'wp_';

// Define the ABSPATH
define( 'ABSPATH', __DIR__ . '/' );

// Redis configuration
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );

// Load WordPress settings
require_once ABSPATH . 'wp-settings.php';
EOF

fi
