#!/bin/bash
echo "Stop running services..."
docker compose -f uav-api/infrastructure/docker-compose.yml stop
docker compose -f gcs-proxy/infrastructure/docker-compose.yml stop
docker compose -f service-handler-api/infrastructure/docker-compose.yml stop
echo "Removing existing services..."
docker compose -f uav-api/infrastructure/docker-compose.yml rm
docker compose -f gcs-proxy/infrastructure/docker-compose.yml rm
docker compose -f service-handler-api/infrastructure/docker-compose.yml rm
echo "Removing existing volumes..."
docker compose -f uav-api/infrastructure/docker-compose.yml rm -v
docker compose -f gcs-proxy/infrastructure/docker-compose.yml rm -v
docker compose -f service-handler-api/infrastructure/docker-compose.yml rm -v

docker system prune --volumes
docker system prune --all --volumes