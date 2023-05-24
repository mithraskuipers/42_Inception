<?php

/* Load environment variables from .env file */
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

/* MySQL settings */
define('DB_NAME',$_ENV['MDB_DB_NAME']);
define('DB_USER',$_ENV['DB_USER']);
define('DB_PASSWORD',$_ENV['DB_PASSWORD']);
define('DB_HOST',$_ENV['DB_HOST']);
define('DB_CHARSET',$_ENV['DB_CHARSET']);
define( 'WPMS_ON', false ); # Turn of email feature, otherwise error during build

/* MySQL database table prefix. */
$table_prefix = 'wp_';

/* Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/* Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
