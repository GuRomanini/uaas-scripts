#!/bin/bash
echo "Stop running services..."
docker compose -f service-handler-api/infrastructure/docker-compose.yml stop
docker compose -f gcs-proxy/infrastructure/docker-compose.yml stop
docker compose -f uav-api/infrastructure/docker-compose.yml stop
echo "Removing existing services..."
docker compose -f service-handler-api/infrastructure/docker-compose.yml rm
docker compose -f gcs-proxy/infrastructure/docker-compose.yml rm
docker compose -f uav-api/infrastructure/docker-compose.yml rm
echo "Creating networks..."
docker network create ground-network
docker network create uaas-network
echo "Building app..."
docker compose -f service-handler-api/infrastructure/docker-compose.yml build
docker compose -f gcs-proxy/infrastructure/docker-compose.yml build
docker compose -f uav-api/infrastructure/docker-compose.yml build
echo "Connecting containers..."
docker network connect uaas-network service-handler-api
docker network connect ground-network gcs-proxy
docker network connect uaas-network gcs-proxy
docker network connect ground-network uav-api
echo "Running docker-compose files"
docker compose -f service-handler-api/infrastructure/docker-compose.yml -f gcs-proxy/infrastructure/docker-compose.yml -f uav-api/infrastructure/docker-compose.yml up

# echo "Stop running services..."
# docker-compose -f uav-api/infrastructure/docker-compose.yml stop
# docker-compose -f gcs-proxy/infrastructure/docker-compose.yml stop
# docker-compose -f service-handler-api/infrastructure/docker-compose.yml stop
# echo "Removing existing services..."
# docker-compose -f uav-api/infrastructure/docker-compose.yml rm
# docker-compose -f gcs-proxy/infrastructure/docker-compose.yml rm
# docker-compose -f service-handler-api/infrastructure/docker-compose.yml rm
# echo "Building app..."
# docker-compose -f uav-api/infrastructure/docker-compose.yml build
# docker-compose -f gcs-proxy/infrastructure/docker-compose.yml build
# docker-compose -f service-handler-api/infrastructure/docker-compose.yml build
# # echo "Creating network..."
# # docker network create app-network
# echo "Running docker-compose files"
# docker-compose -f uav-api/infrastructure/docker-compose.yml -f gcs-proxy/infrastructure/docker-compose.yml  -f service-handler-api/infrastructure/docker-compose.yml up