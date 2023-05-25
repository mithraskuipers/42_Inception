#!bin/bash

# This Bash script is responsible for setting up a MariaDB database. It performs the following steps:
#
# Checks if the database is already set up.
# Creates the necessary directories for the MariaDB server.
# Sets appropriate ownership for the directories.
# Initializes the MariaDB database using the mysql_install_db command.
# Defines SQL commands in an init.sql file to be executed later.
# Creates the database, creates users with specified login credentials, grants privileges, and flushes privileges.
# Starts the MariaDB server in the foreground with the specified user and console output.
# If the database is already set up, the script proceeds directly to starting the MariaDB server.

if [ ! -d /run/mysqld ] #checks if the database is not already set up
then

	echo "Setting up MariaDB"

	# Create the run directory for mysqld
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql #initializes database

# Creates a temporary file to store the SQL commands to be executed, creates the database and the users
cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$MDB_ROOT_PASS';
	CREATE DATABASE IF NOT EXISTS $MDB_DB_NAME;
	CREATE USER '$WP_USER2_LOGIN'@'%';
	SET PASSWORD FOR '$WP_USER2_LOGIN'@'%' = PASSWORD('$WP_USER2_PW');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USER2_LOGIN'@'%';
	GRANT ALL ON wordpress.* to '$WP_USER2_LOGIN'@'%';
	FLUSH PRIVILEGES;
	CREATE USER '$WP_USER1_LOGIN'@'%';
	SET PASSWORD FOR '$WP_USER1_LOGIN'@'%' = PASSWORD('$WP_USER1_PW');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USER1_LOGIN'@'%';
	GRANT ALL ON wordpress.* to '$WP_USER1_LOGIN'@'%';
	GRANT GRANT OPTION ON wordpress.* TO '$WP_USER1_LOGIN'@'%'; # Grant the admin user the ability to grant privileges
	FLUSH PRIVILEGES;
EOF

mysqld --user=mysql --bootstrap < init.sql

fi

echo "MariaDB started"
exec mysqld --user=mysql --console # Starts the MySQL database server in the foreground