mkdir /home/$USER/inception ;
mkdir /home/$USER/inception/srcs ;
touch /home/$USER/inception/Makefile ;
touch /home/$USER/inception/srcs/.env ;
touch /home/$USER/inception/srcs/docker-compose.yml ;
mkdir -p /home/$USER/inception/srcs/requirements/mariadb/conf ;
mkdir -p /home/$USER/inception/srcs/requirements/tools ;
touch /home/$USER/inception/srcs/requirements/mariadb/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/mariadb/conf/create_db.sh ;
mkdir -p /home/$USER/inception/srcs/requirements/nginx/conf ;
touch /home/$USER/inception/srcs/requirements/nginx/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/nginx/conf/nginx.conf ;
mkdir -p /home/$USER/inception/srcs/requirements/wordpress/conf ;
touch /home/$USER/inception/srcs/requirements/wordpress/Dockerfile ;
touch /home/$USER/inception/srcs/requirements/wordpress/conf/wp-config-create.sh ;
touch /home/$USER/inception/srcs/requirements/mariadb/.dockerignore ;
touch /home/$USER/inception/srcs/requirements/wordpress/.dockerignore ;
mkdir -p /home/$USER/inception/srcs/requirements/mariadb/tools ;
mkdir -p /home/$USER/inception/srcs/requirements/wordpress/tools ;
mkdir /home/$USER/inception/srcs/requirements/nginx/tools/ ;