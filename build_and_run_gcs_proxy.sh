echo "Building gcs-proxy..."
docker compose -f gcs-proxy/infrastructure/docker-compose.yml build
docker compose -f gcs-proxy/infrastructure/docker-compose.yml up
