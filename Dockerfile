FROM debian:bookworm-slim

# Install required packages and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    bash \
    curl \
    file \
    lsof \
    procps \
    libssl3 \
    libstdc++6 \
    libgcc-s1 \
    libatomic1 \
    libgomp1 \
    libzstd1 \
    liblz4-1 \
    libcurl4 \
    libuv1 \
    libsqlite3-0 \
    libdbus-1-3 \
    libexpat1 \
    libsystemd0 \
    libudev1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download and install RustDesk Server binaries
RUN RUSTDESK_VERSION=1.1.10-2 && \
    curl -L -o /usr/local/bin/hbbs https://github.com/rustdesk/rustdesk-server/releases/download/${RUSTDESK_VERSION}/hbbs && \
    curl -L -o /usr/local/bin/hbbr https://github.com/rustdesk/rustdesk-server/releases/download/${RUSTDESK_VERSION}/hbbr && \
    chmod +x /usr/local/bin/hbbs /usr/local/bin/hbbr

# Expose RustDesk Server ports
EXPOSE 21115-21119

# Default command (will be overridden by docker-compose)
CMD ["hbbs"]
