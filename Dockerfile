# Use the official RustDesk server image as base
FROM rustdesk/rustdesk-server:latest

# Install bash
RUN apt-get update && apt-get install -y bash

# Default command (can be overridden by docker-compose)
CMD ["hbbs"]
