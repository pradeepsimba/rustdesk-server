FROM debian:bookworm-slim

# Install required packages and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    curl \
    unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download and install RustDesk Server binaries
RUN RUSTDESK_VERSION=1.1.10-2 && \
    curl -L -o rustdesk-server.zip https://github.com/rustdesk/rustdesk-server/releases/download/${RUSTDESK_VERSION}/rustdesk-server-linux-amd64.zip && \
    unzip rustdesk-server.zip && \
    mv hbbs hbbr /usr/local/bin/ && \
    chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr && \
    rm rustdesk-server.zip

# Expose RustDesk Server ports
EXPOSE 21115-21119

# Default command (will be overridden by docker-compose)
CMD ["hbbs"]
