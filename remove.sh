#!/bin/sh
# Quick destructive cleanup (matches the style you provided)
# Stops and removes named containers, prunes containers and system, then brings
# down the compose project and its volumes.

sudo docker stop hbbs hbbr && \
sudo docker rm hbbs hbbr && \
sudo docker container prune -f && \
sudo docker system prune -a -f && \
sudo docker compose -p rustdesk_server down -v
