echo "Building service handler app..."
docker compose -f service-handler-api/infrastructure/docker-compose.yml build
docker compose -f service-handler-api/infrastructure/docker-compose.yml up
docker network connect uaas-network db
docker network connect uaas-network service-handler-api