#!/bin/sh

# Check if wp-config.php file exists
if [ ! -f "/var/www/wp-config.php" ]; then

    # Create the wp-config.php file
    cat << EOF > /var/www/wp-config.php
<?php

// Database configuration
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

// Filesystem method
//define('FS_METHOD','direct');

// Table prefix
\$table_prefix = 'wp_';

// Define the ABSPATH
//define( 'ABSPATH', __DIR__ . '/' );

// Redis configuration
//define( 'WP_REDIS_HOST', 'redis' );
//define( 'WP_REDIS_PORT', 6379 );
//define( 'WP_REDIS_TIMEOUT', 1 );
//define( 'WP_REDIS_READ_TIMEOUT', 1 );
//define( 'WP_REDIS_DATABASE', 0 );

// Load WordPress settings
require_once ABSPATH . 'wp-settings.php';
EOF

fi

