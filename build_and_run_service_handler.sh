echo "Building service handler app..."
docker compose -f service-handler-api/infrastructure/docker-compose.yml build
docker compose -f service-handler-api/infrastructure/docker-compose.yml up -d