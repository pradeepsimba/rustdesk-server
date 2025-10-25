FROM debian:bookworm-slim

# Install required packages and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download and install RustDesk Server ARM64 binaries
RUN RUSTDESK_VERSION=1.1.10-2 && \
    curl -L -o /usr/local/bin/hbbs https://github.com/rustdesk/rustdesk-server/releases/download/${RUSTDESK_VERSION}/hbbs-linux-arm64 && \
    curl -L -o /usr/local/bin/hbbr https://github.com/rustdesk/rustdesk-server/releases/download/${RUSTDESK_VERSION}/hbbr-linux-arm64 && \
    chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr

# Expose RustDesk Server ports
EXPOSE 21115-21119

# Default command (will be overridden by docker-compose)
CMD ["hbbs"]
