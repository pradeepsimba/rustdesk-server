#!/bin/bash
# Clean everything and rebuild

# Stop and remove containers
echo "Stopping and removing containers..."
docker compose down

# Remove all related images
echo "Removing old images..."
docker rmi rustdesk/rustdesk-server:local rustdesk/rustdesk-server:latest || true

# Clean docker build cache
echo "Cleaning build cache..."
docker builder prune -f

# Rebuild images
echo "Rebuilding images..."
docker compose build --no-cache

# Start services
echo "Starting services..."
docker compose up -d

# Show container status
echo "Container status:"
docker ps -a | grep "hbb"