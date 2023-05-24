FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client nano

# COPY tools/start /tmp/
COPY tools/setup_mariadb.sh /tmp/
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod +x /tmp/setup_mariadb.sh

# RUN service mysql start && chmod +x /tmp/setup_mariadb.sh && mysql -uroot < /tmp/setup_mariadb.sql

RUN sed 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/' -i  /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf 


ENTRYPOINT ["/tmp/setup_mariadb.sh"]