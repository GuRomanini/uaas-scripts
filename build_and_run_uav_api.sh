echo "Building uav app..."
docker compose -f uav-api/infrastructure/docker-compose.yml build
docker compose -f uav-api/infrastructure/docker-compose.yml up
docker network connect ground-network uav-api
