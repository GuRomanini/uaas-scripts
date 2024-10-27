echo "Building gcs-proxy..."
docker compose -f gcs-proxy/infrastructure/docker-compose.yml build
docker compose -f gcs-proxy/infrastructure/docker-compose.yml up
docker network connect ground-network gcs-proxy
docker network connect uaas-network gcs-proxy
