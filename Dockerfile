FROM debian:bookworm-slim

# Install a minimal runtime and bash so `docker exec -it <container> bash` works
RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates bash curl \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /app

# NOTE: Binaries (hbbs/hbbr) are mounted at runtime via docker-compose volumes
# Place your hbbs and hbbr executables in ./bin/ directory
# They will be mounted into /usr/local/bin inside containers

# Expose common RustDesk server ports
EXPOSE 21115 21116 21117 21118 21119

# Default command — can be overridden by docker-compose or `docker run`.
CMD ["hbbs"]
