#!/bin/bash



# adding -d for when we bring services up
args=("$@")
if [ "$1" = "up" ]; then
  args=("${args[@]}" -d)
fi


# All the services
echo "Bringing all services ${args[@]}"

# system
docker compose -f ./duckdns/docker-compose.yml ${args[@]}

# services
docker compose -f ./authelia/docker-compose.yml ${args[@]}
docker compose -f ./dashy/docker-compose.yml ${args[@]}
docker compose -f ./immich/docker-compose.yml ${args[@]}
docker compose -f ./LibreChat/docker-compose.yml ${args[@]}
docker compose -f ./privatebin/docker-compose.yml ${args[@]}
docker compose -f ./psitransfer/docker-compose.yml ${args[@]}
docker compose -f ./searxng/docker-compose.yml ${args[@]}
docker compose -f ./shlink/docker-compose.yml ${args[@]}
docker compose -f ./watchtower/docker-compose.yml ${args[@]}


# temps
# docker compose -f ./minecraft_fabric/docker-compose.yml ${args[@]}


# wait till things are up before starting nginx
if [ "$1" = "up" ]; then
  sleep 15
fi

docker compose -f ./nginx/docker-compose.yml ${args[@]}


# template
# docker compose -f .//docker-compose.yml ${args[@]}

