#!/bin/bash





# Create directory for WordPress
mkdir -p /var/www/wordpress

# Check if wp-config.php file doesn't exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    cd /var/www/wordpress # Go into volume

    # Download WordPress core
    wp core download --allow-root

    # Create wp-config.php file
    wp config create --allow-root --path= --dbname=$MDB_DB_NAME --dbuser=$WP_USER1_LOGIN --dbpass=$WP_USER1_PW --dbhost=mariadb --config-file=/var/www/wordpress/wp-config.php --skip-packages --skip-plugins
    echo "Created wp-config.php file"

    # Install WordPress
    wp core install --allow-root --url=$WP_URL --admin_user=$WP_USER1_LOGIN --admin_password=$WP_USER1_PW --title=mijn_eigen_site --admin_email=user1@42.fr

    # Create second user
    wp user create $WP_USER2_LOGIN user2@42.fr --allow-root --user_pass=$WP_USER2_PW

    # Change ownership of WordPress directory
    chown -R www-data:www-data /var/www/wordpress
fi

echo "WordPress started"
php-fpm7.3 -R -F # Runs on the foreground as root
