PROJECT = inception

LIST_CONTAINERS := $(shell docker ps -a -q)
LIST_VOLUMES := $(shell docker volume ls -q)

all:
	mkdir -p /home/mikuiper/data/mariadb
	mkdir -p /home/mikuiper/data/wordpress
	docker-compose -f src/docker-compose.yml up --build

kill:
	docker-compose -f src/docker-compose.yml stop ;
	docker-compose -f src/docker-compose.yml kill ;

clean:
	docker-compose -f src/docker-compose.yml down
	sudo rm -rf /home/mikuiper/data/ ;
	docker stop $(docker ps -aq) 2>/dev/null && \
	docker kill $(docker ps -aq) 2>/dev/null && \
	docker rm $(docker ps -aq) 2>/dev/null && \
	docker image prune -a --force --filter "until=24h" 2>/dev/null && \
	docker volume prune --force 2>/dev/null && \
	docker network prune --force 2>/dev/null || true ;
