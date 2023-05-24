#!/bin/bash

# Check if the MySQL data directory exists
if [ ! -d "/var/lib/mysql/mysql" ]; then

    # Change ownership of the data directory to the MySQL user
    chown -R mysql:mysql /var/lib/mysql

    # Initialize the MySQL database
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm

    # Create a temporary file to be used later
    tfile=`mktemp`

    # Check if the temporary file was created successfully
    if [ ! -f "$tfile" ]; then
        return 1
    fi
fi

# Check if the WordPress database directory exists
if [ ! -d "/var/lib/mysql/wordpress" ]; then

    # Create a SQL script to create the WordPress database
    cat << EOF > /tmp/create_db.sql
USE mysql;
FLUSH PRIVILEGES;

# Remove empty users
DELETE FROM mysql.user WHERE User='';

# Drop the test database
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';

# Remove root user access from external hosts
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# Change the password for the root user
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';

# Create the WordPress database
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;

# Create a new user for the WordPress database
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';

# Grant all privileges to the user on the WordPress database
GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%';

# Flush privileges to apply the changes
FLUSH PRIVILEGES;
EOF

    # Run the SQL script to create the WordPress database
    /usr/bin/mysqld --user=mysql --bootstrap < /tmp/create_db.sql

    # Remove the temporary file
    rm -f /tmp/create_db.sql
fi