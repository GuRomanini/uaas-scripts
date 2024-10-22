#!/bin/bash
echo "Stop running services..."
docker-compose -f service-handler-api/infrastructure/docker-compose.yml stop
docker-compose -f uav-api/infrastructure/docker-compose.yml stop
echo "Removing existing services..."
docker-compose -f service-handler-api/infrastructure/docker-compose.yml rm
docker-compose -f uav-api/infrastructure/docker-compose.yml rm
echo "Building app..."
docker-compose -f service-handler-api/infrastructure/docker-compose.yml build
docker-compose -f uav-api/infrastructure/docker-compose.yml build
echo "Creating network..."
docker network create app-network
echo "Running docker-compose files"
# docker-compose -f service-handler-api/infrastructure/docker-compose.yml -f uav-api/infrastructure/docker-compose.yml up